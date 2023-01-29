# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-brightbox
pkgname=ruby-$_gemname
pkgver=1.11.0
pkgrel=1
pkgdesc='Module for the fog gem to support Brightbox Cloud'
arch=(any)
url='https://rubygems.org/gems/fog-brightbox'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-dry-inflector)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('b9eab8a34296de44bc9354afb32df08fbf8a06713010bb0fbfb9a9161d73dba47f941ce5544750275e64b178b0a1576eb8ad6e1db39a7943e8d3be977e2c46ea')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
