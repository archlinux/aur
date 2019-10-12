# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-cldr
pkgver=0.0.0
_rockname=cldr
_rockrel=0
pkgrel=2
pkgdesc="Unicode CLDR data and Lua interface."
arch=('any')
url="https://github.com/alerque/cldr-lua"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
source=("https://raw.githubusercontent.com/alerque/cldr-lua/master/rockspecs/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('616ea4ce725b919fc307e2297a7fe2c092749a19602175cf465e76ce2faadeb2')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
