pkgname=lua-iconv
pkgver=7
pkgrel=1
pkgdesc="Lua bindings for POSIX APIs and curses"
arch=('i686' 'x86_64')
url="https://luaposix.github.io/luaposix"
license=('custom')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$pkgname-$pkgver-$pkgrel.src.rock")
sha512sums=('88046ca7aec54993c64a1cd6d5a2c6a7793a3987b21d37441ad23bb3af229b3cd28385b73cd99f9351a3362b7219709bad762f401c70926f0dbbe5efd7a61e8e')

package() {
  luarocks --tree="$pkgdir/usr" install "$pkgname-$pkgver-$pkgrel.src.rock"

  mkdir -p "$pkgdir/usr/share/doc"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/lib/luarocks/rocks-"*"/lua-iconv/$pkgver-$pkgrel/doc/README" "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/lib/luarocks/rocks-"*"/lua-iconv/$pkgver-$pkgrel/doc/COPYING" "$pkgdir/usr/share/licenses/$pkgname"
  rm -rf "$pkgdir/usr/lib/luarocks"
}

