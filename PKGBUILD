# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-luacov-coveralls
pkgver=0.2.2
_rockname=luacov-coveralls
_rockrel=1
pkgrel=2
pkgdesc="LuaCov reporter for coveralls.io service"
arch=('i686' 'x86_64')
url="http://github.com/moteus/luacov-coveralls"
license=('MIT')
depends=('lua' 'lua-luacov')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('177f2607beaef022c7e929eb3efa2f3fd7f67ff7097e73ad628f0718870e1bcf')

package() {
    luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.src.rock"
    find "$pkgdir/usr" -name manifest -delete
    sed -i -e "s#' '.*/usr/lib/#' '/usr/lib/#" "$pkgdir/usr/bin/luacov-coveralls"
}
