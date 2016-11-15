pkgname=lcurses
pkgver=9.0.0
pkgrel=1
pkgdesc="Lua bindings for curses"
arch=('i686' 'x86_64')
url="https://luaposix.github.io/luaposix"
license=('custom')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$pkgname-$pkgver-$pkgrel.src.rock")
sha512sums=('09225ab0bcd2a681ec81bdfc26446c943535474a81eef1e001fbb4d482a2d3dfa3482081424e7d89ce654787e39539720ffd588710ac16db1b665ee2692ab138')

package() {
  luarocks --tree="$pkgdir/usr" install "$pkgname-$pkgver-$pkgrel.src.rock"

  mkdir -p "$pkgdir/usr/share/doc"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/lib/luarocks/rocks-"*"/lcurses/$pkgver-$pkgrel/doc/lcurses" "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/lib/luarocks/rocks-"*"/lcurses/$pkgver-$pkgrel/doc/COPYING" "$pkgdir/usr/share/licenses/$pkgname"
  rm -rf "$pkgdir/usr/lib/luarocks"
}

