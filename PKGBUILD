# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cassowary
pkgname=lua-$_rockname
pkgver=2.0
_rockrel=1
pkgrel=1
pkgdesc="The cassowary constraint solver."
arch=('i686' 'x86_64')
url="https://github.com/simoncozens/cassowary.lua"
license=('MIT')
depends=('lua' 'lua-penlight')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('adb8ce1122147d10c9a35bd6ee34b3151b808ed81a168eb0c09603223ad41b6d')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
