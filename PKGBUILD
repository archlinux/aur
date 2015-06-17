# Maintainer: Anatol Pomozov anatol dot pomozov at g mail

pkgname=sldr
pkgver=1.2
pkgrel=1
pkgdesc='Super Light Async DNS Resolver'
arch=(i686 x86_64)
license=(GPL2)
depends=(glibc)
url='https://github.com/cesanta/sldr'
source=(https://github.com/cesanta/sldr/archive/$pkgver.tar.gz)
sha1sums=('216950df11e0f600233e87aa9e7ca0a303637f60')

build() {
  cd sldr-$pkgver
  gcc -shared -fPIC $CFLAGS $LDFLAGS sldr.c -o libsldr.so
}

package() {
  cd sldr-$pkgver
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 libsldr.so "$pkgdir/usr/lib/libsldr.so"
  install -D -m644 sldr.h "$pkgdir/usr/include/sldr.h"
}
