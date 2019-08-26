# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=luarepl
pkgname=lua-repl
pkgver=0.9
_rockrel=1
pkgrel=1
pkgdesc="A reusable REPL component for Lua, written in Lua"
arch=('i686' 'x86_64')
url="https://github.com/hoelzro/lua-repl"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$_rockname-$pkgver-$_rockrel.rockspec")
sha256sums=('1fc5b25e5dfffe1407537b58f7f118379ed3e86e86c09c0b9e4893ddada20990')

package() {
  luarocks --tree="$pkgdir/usr" install --deps-mode=none "$_rockname-$pkgver-$_rockrel.rockspec"
  find "$pkgdir/usr" -name manifest -delete
}
