# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=sleeping-getty
pkgver=1.2
pkgrel=1
pkgdesc="Do not start a fullblown getty before it is necessary"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/sleeping-getty"
license=('custom:ISC')
depends=()
makedepends=(linux-api-headers)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(0622e1f5de6b22be2463bef3e3e11cc360f79ccec77ff3034dfd1a3e2a7e78f2)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  mv -- "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
