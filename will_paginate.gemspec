# encoding: utf-8
require 'rbconfig'
require File.expand_path('../lib/will_paginate/version', __FILE__)

Gem::Specification.new do |s|
  s.name    = 'will_paginate'
  s.version = WillPaginate::VERSION::STRING
  
  s.summary = "Fork of mislav/will_paginate"
  s.description = "only difference with mislav's will_paginate is that *?page=1* parameter is removed from first page, like google seo tips say"
  
  s.authors  = ['Vladimir Dimitrov']
  s.email    = 'vkdimitrov@gmail.com'
  s.homepage = 'https://github.com/vkdimitrov/will_paginate'
  s.license  = 'MIT'
  
  s.rdoc_options = ['--main', 'README.md', '--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'LICENSE']
  
  s.files = Dir['Rakefile', '{bin,lib,test,spec}/**/*', 'README*', 'LICENSE*']

  # include only files in version control
  git_dir = File.expand_path('../.git', __FILE__)
  void = defined?(File::NULL) ? File::NULL :
    RbConfig::CONFIG['host_os'] =~ /msdos|mswin|djgpp|mingw/ ? 'NUL' : '/dev/null'

  if File.directory?(git_dir) and system "git --version >>#{void} 2>&1"
    s.files &= `git --git-dir='#{git_dir}' ls-files -z`.split("\0") 
  end
end
