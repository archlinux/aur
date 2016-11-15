pkgname=luaposix
pkgver=33.4.0
pkgrel=1
pkgdesc="Lua bindings for POSIX APIs"
arch=('i686' 'x86_64')
url="https://luaposix.github.io/luaposix"
license=('custom')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$pkgname-$pkgver-$pkgrel.src.rock")
sha512sums=('eca56c9e0e465c3b6d22b4bf41ead48d5b70201dbbabd72ee31f1866a25419e35f797ca5bc4b42727f9193b4481aca4d3eeb4489f206af951eb31cc7bf71bcde')

package() {
  luarocks --tree="$pkgdir/usr" install "$pkgname-$pkgver-$pkgrel.src.rock"

  mkdir -p "$pkgdir/usr/share/doc"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/lib/luarocks/rocks-"*"/luaposix/$pkgver-$pkgrel/doc/luaposix" "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/lib/luarocks/rocks-"*"/luaposix/$pkgver-$pkgrel/doc/COPYING" "$pkgdir/usr/share/licenses/$pkgname"
  rm -rf "$pkgdir/usr/lib/luarocks"
}

