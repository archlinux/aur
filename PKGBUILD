# Maintainer: sum01 <sum01@protonmail.com>
pkgname=nodejs-lua-fmt
_srcname="lua-fmt"
pkgver=2.5.0
pkgrel=1
pkgdesc="A pretty-printer for Lua code"
arch=('i686' 'x86_64')
url="https://github.com/trixnz/lua-fmt"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_srcname/-/$_srcname-$pkgver.tgz")
noextract=($_srcname-$pkgver.tgz)
sha512sums=('9f6b030629a0503b46df8efbad74939fcad4863c7a078a88c96002418eb1d1f25a7742cd2e82950030f863e34e7081f3c2425bc619cae5f741c8c6106529828c')
package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_srcname-$pkgver.tgz"
  rm -rf "$pkgdir/usr/etc"
  install -Dm644 "$pkgdir/usr/lib/node_modules/$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
