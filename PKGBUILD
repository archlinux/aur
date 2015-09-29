# Maintainer: Anatol Pomozov anatol dot pomozov at g mail

pkgname=v7
pkgver=1.0
pkgrel=1
pkgdesc='Simple and fast JavaScript engine written in C'
arch=(i686 x86_64)
license=(GPL2)
depends=(glibc)
url='https://github.com/cesanta/v7'
source=(v7-$pkgver.tar.gz::https://github.com/cesanta/v7/archive/$pkgver.tar.gz)
sha1sums=('0adcf7c48e7ae99fb69087905ce0c828c9671730')

build() {
  cd v7-$pkgver
  CFLAGS_EXTRA="$CFLAGS" make v7
}

check() {
  cd v7-$pkgver
  make test
}

package() {
  cd v7-$pkgver
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 v7 "$pkgdir/usr/bin/v7"
  #install -D -m755 v7.so "$pkgdir/usr/lib/libv7.so"
  install -D -m644 v7.h "$pkgdir/usr/include/v7.h"
}
