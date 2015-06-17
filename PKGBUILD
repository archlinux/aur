# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=vedis
pkgver=1.2.6
pkgrel=1
pkgdesc='an embeddable datastore C library built with over 70 commands similar in concept to Redis but without the networking layer'
arch=(i686 x86_64)
url='http://vedis.symisc.net/'
license=(Sleepycat)
source=(http://vedis.symisc.net/db/vedis-ds-${pkgver//./}.zip)
sha256sums=('64d5f8ddabfa3733843fbdd53615d83a1da794a0ee437442f38be8a9adff7118')

build() {
  gcc -c -fPIC vedis.c -o vedis.o
  gcc vedis.o -shared -o libvedis.so
}

package() {
  install -D -m644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -D -m644 libvedis.so "$pkgdir/usr/lib/libvedis.so"
  install -D -m644 vedis.h "$pkgdir/usr/include/vedis.h"
}
