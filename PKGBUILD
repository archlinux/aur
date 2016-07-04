# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=arel
pkgname=ruby-$_gemname
pkgver=7.0.0
pkgrel=1
pkgdesc='Arel Really Exasperates Logicians  Arel is a SQL AST manager for Ruby'
arch=(any)
url='https://github.com/rails/arel'
license=(MIT)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('dc226b0bb0c1cb0023897de8c8ec3de1657d5a47d78d7a841d8183b18df87bee0c56a3c18004f66f3d914acc1ede6f6a7bce998db64bcf1bac5e14240ddccaf1')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/MIT-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE.txt"
}
