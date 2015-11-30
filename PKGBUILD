# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-voxel
pkgname=ruby-$_gemname
pkgver=0.1.0
pkgrel=1
pkgdesc='This library can be used as a module for fog or as standalone provider to use the Voxel in applications.'
arch=(any)
url='https://rubygems.org/gems/fog-voxel'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-xml)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
sha512sums=('3bd159c4b9128910b660563716fc7b1845e5530d3b16bb7dbf7b10e3edede79fb2a4eee2589a322e3e5c72e1339f2d9012b790e478778c0fe31390b4d9cf78da')
