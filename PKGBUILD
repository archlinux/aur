# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=xml-simple
pkgname=ruby-$_gemname
pkgver=1.1.5
pkgrel=1
pkgdesc='A simple API for XML processing.'
arch=(any)
url='https://github.com/maik/xml-simple'
license=(MIT)
depends=(ruby )
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('30b8e9541d4047181df34f3558235aa2058f8fda26220a90bc811b3f438130a69d06c72b52ba4fe5caadf779195d3bf772253bdb70db5df238f5117c7362e97f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
