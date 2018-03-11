# Maintainer: sum01 <sum01@protonmail.com>
pkgname=nodejs-lua-fmt
_srcname="lua-fmt"
pkgver=2.6.0
pkgrel=1
pkgdesc="A pretty-printer for Lua code"
arch=('i686' 'x86_64')
url="https://github.com/trixnz/lua-fmt"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_srcname/-/$_srcname-$pkgver.tgz")
noextract=($_srcname-$pkgver.tgz)
sha512sums=('2780fb4caf8185227d78f40fa593e5bbf6871375fda2337e0fb0cdbf51d764faf2049ef85d65665e9457faa71e5dd135e5352c4110a3f70f35c1a54e38585f58')
package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_srcname-$pkgver.tgz"
  rm -rf "$pkgdir/usr/etc"
  install -Dm644 "$pkgdir/usr/lib/node_modules/$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
