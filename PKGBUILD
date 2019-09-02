# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua-system
pkgver=0.2.1
_rockname=luasystem
_rockrel=0
pkgrel=1
pkgdesc="Platform independent system calls for Lua."
arch=('i686' 'x86_64')
url="http://olivinelabs.com/luasystem"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('d1c706d48efc7279d33f5ea123acb4d27e2ee93e364bedbe07f2c9c8d0ad3d24')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
