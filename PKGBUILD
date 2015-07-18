pkgname=luaposix
pkgver=33.3.1
pkgrel=1
pkgdesc="Lua bindings for POSIX APIs and curses"
arch=('i686' 'x86_64')
url="https://luaposix.github.io/luaposix"
license=('custom')
depends=('lua')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/$pkgname-$pkgver-$pkgrel.src.rock")
sha512sums=('e8a964ba93f3fd36e1582d068d06954f948e0cef184772bffe34291f16fb09c7e6a773327a68d5f9c49380b2ba32b0e5d8b1697e3d46bb4732221b22009f293e')

package() {
  luarocks --tree="$pkgdir/usr" install "$pkgname-$pkgver-$pkgrel.src.rock"

  mkdir -p "$pkgdir/usr/share/doc"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/lib/luarocks/rocks-"*"/luaposix/$pkgver-$pkgrel/doc/luaposix" "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/lib/luarocks/rocks-"*"/luaposix/$pkgver-$pkgrel/doc/COPYING" "$pkgdir/usr/share/licenses/$pkgname"
  rm -rf "$pkgdir/usr/lib/luarocks"
}

