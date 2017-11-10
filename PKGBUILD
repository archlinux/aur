# Maintainer: sum01 <sum01@protonmail.com>
pkgname=nodejs-lua-fmt
_srcname="lua-fmt"
pkgver=2.4.0
pkgrel=1
pkgdesc="A pretty-printer for Lua code"
arch=('i686' 'x86_64')
url="https://github.com/trixnz/lua-fmt"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_srcname/-/$_srcname-$pkgver.tgz")
noextract=($_srcname-$pkgver.tgz)
sha512sums=('81a7fa1310a847ebff54344103b7869623b32ac1b6fb273212e4274f68977a1d0206e466d53cd5eb97464fd8018956a35b24c729f2ab0ef9db7d39295d8a9ed0')
package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_srcname-$pkgver.tgz"
  rm -rf "$pkgdir/usr/etc"
  install -Dm644 "$pkgdir/usr/lib/node_modules/$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
