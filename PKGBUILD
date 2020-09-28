# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=serverengine
pkgname=ruby-$_gemname
pkgver=2.2.1
pkgrel=1
pkgdesc='A framework to implement robust multiprocess servers'
arch=(x86_64)
url='https://github.com/treasure-data/serverengine'
license=(Apache)
depends=(ruby ruby-sigdump)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('0c68bfd59c0f6abbb294ecd8003c80853413b38b05ba1553230a2a49ffbf56dad43428eafbac4e77a012d66fdc30d4445249aed53e6eead11f52f5aeffd91c1e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

