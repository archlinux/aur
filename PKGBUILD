# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-cldr
pkgver=0.0.0
_rockname=cldr
_rockrel=0
pkgrel=1
pkgdesc="Unicode CLDR data and Lua interface."
arch=('any')
url="https://github.com/alerque/lua-cldr"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
source=("https://raw.githubusercontent.com/alerque/cldr-lua/$pkgver/$_rockname-scm-$_rockrel.rockspec")
sha256sums=('15688e20d9754b17a9b9d3239e885b32263f0a179f3b4fb5d3173b21c43cd821')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-scm-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
