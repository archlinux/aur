# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=sleeping-getty
pkgver=1.2
pkgrel=1
pkgdesc="Do not start a fullblown getty before it is necessary"
arch=(i686 x86_64)
url="https://github.com/maandree/sleeping-getty"
license=('custom:ISC')
depends=()
makedepends=(linux-api-headers)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(ad7b75ec6bc2700278596015cee9349fbb5608bdc317d3100feac0608e552fe2)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  mv -- "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
