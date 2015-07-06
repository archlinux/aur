 # Contributor: realitygaps <realitygaps AT yahoo DOT com>
 pkgname=ruby-youtube-g 
 pkgver=0.5.0
 pkgrel=1
 pkgdesc="Ruby gem youtube-g which implements Youtube GData API"
 arch=(any)
 url="http://rubyforge.org/projects/youtube-g/"
 license=(GPL)
 depends=(ruby)
 makedepends=(rubygems)
 source=(http://gems.rubyforge.org/gems/youtube-g-$pkgver.gem)
 noextract=(youtube-g-$pkgver.gem)
 md5sums=('4d14c30d0fbeb1401fbd1cde41fd013e')
 
 build() {
   cd $srcdir
   # _gemdir is defined inside build() because if ruby[gems] is not installed on the system
   #  makepkg will barf when sourcing the PKGBUILD
   local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
 
   gem install --ignore-dependencies -i "$pkgdir$_gemdir" youtube-g-$pkgver.gem
 }

