do_rehash = false

hook = lambda do |installer|
  if installer.spec.executables.any?
    do_rehash = true
  end
end

Gem.post_install(&hook)
Gem.post_uninstall(&hook)

at_exit do
  if do_rehash
    system 'rbenv', 'rehash'
  end
end
