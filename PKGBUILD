# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cassowary
pkgname=lua-$_rockname
pkgver=2.1
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
sha256sums=('04c0cba2b6f632a066073cd0b00ea5525ce087bfde7fe5377be850d0812f0beb')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
