# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lua51-metalua-compiler
pkgver=0.7.3
_rockname=metalua-compiler
_rockrel=1
pkgrel=1
pkgdesc="compiles a superset of Lua 5.1 into bytecode"
arch=('i686' 'x86_64')
url="https://luarocks.org/modules/luarocks/metalua-compiler"
license=('GPL')
depends=('lua51' 'lua51-filesystem' 'lua51-metalua-parser')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.src.rock")
sha256sums=('8fa73a111c44012292e66a769f6779a4adc18a02388479f703ea86e787510579')

package() {
  luarocks --lua-version=5.1 --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}
