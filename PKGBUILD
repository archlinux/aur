# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-brightbox
pkgname=ruby-$_gemname
pkgver=1.8.2
pkgrel=1
pkgdesc='Module for the fog gem to support Brightbox Cloud'
arch=(any)
url='https://rubygems.org/gems/fog-brightbox'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-dry-inflector)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('6a14c65e4d41d3711814410260dacc8a3a0fe177dec91bde4d81731ac7ef9da0cb049e1e7fdfaf3b9a952f26b765d3ed34e91273e11f2a5df78fd30c272c87cb')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
