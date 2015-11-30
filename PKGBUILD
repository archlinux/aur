# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=fog-brightbox
pkgname=ruby-$_gemname
pkgver=0.10.0
pkgrel=1
pkgdesc='Module for the fog gem to support Brightbox Cloud'
arch=(any)
url='https://rubygems.org/gems/fog-brightbox'
license=(MIT)
depends=(ruby ruby-fog-core ruby-fog-json ruby-inflecto)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('a5e1681669a78519827795bffd0e9e2738ddee04f457e85f07f264b2129e4bdfc9e126b06495d80f0cfa1fcb987e472805c2d617b07bccd78a62e3771ce18452')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
