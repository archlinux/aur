# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-luacov
pkgver=0.8
_rockname=luacov
_rockrel=1
pkgrel=2
pkgdesc="Coverage analysis tool for Lua scripts"
arch=('i686' 'x86_64')
url="http://keplerproject.github.io/luacov/"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('f92229ee0ec8ce285e749ede4a9f2f2efa7460d8fee0ad28299f87a45a181ab8')

package() {
    luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.src.rock"
    find "$pkgdir/usr" -name manifest -delete
    sed -i -e "s#' '.*/usr/lib/#' '/usr/lib/#" "$pkgdir/usr/bin/luacov"
}
