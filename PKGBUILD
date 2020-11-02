# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=serverengine
pkgname=ruby-$_gemname
pkgver=2.2.2
pkgrel=1
pkgdesc='A framework to implement robust multiprocess servers'
arch=(x86_64)
url='https://github.com/treasure-data/serverengine'
license=(Apache)
depends=(ruby ruby-sigdump)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('113ffaa6dd1c35ba0796aaec30c4b3bbc71d63abb7214bd0ed30c7d38195bb2caf4e12d79968ca2750fb522600ac9494848984248fe1645ae3d7c1e97fd6a608')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

