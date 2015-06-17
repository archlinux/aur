# Maintainer: Anatol Pomozov anatol dot pomozov at g mail

pkgname=slre
pkgver=1.3
pkgrel=1
pkgdesc='Super Light Regular Expression library'
arch=(i686 x86_64)
license=(GPL2)
depends=(glibc)
url='https://github.com/cesanta/slre'
source=(https://github.com/cesanta/slre/archive/$pkgver.tar.gz)
sha1sums=('13aefb20d296bc071e2bacafb72cc263bba1906c')

build() {
  cd slre-$pkgver
  gcc -shared -fPIC $CFLAGS $LDFLAGS slre.c -o libslre.so
}

package() {
  cd slre-$pkgver
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 libslre.so "$pkgdir/usr/lib/libslre.so"
  install -D -m644 slre.h "$pkgdir/usr/include/slre.h"
}
