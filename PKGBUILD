# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=sleeping-getty
pkgver=1.2.2
pkgrel=1
pkgdesc="Do not start a fullblown getty before it is necessary"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/sleeping-getty"
license=('custom:ISC')
depends=()
makedepends=(linux-api-headers)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(28350c39045721483b0f86dae91973ea251588194614d1d3ef1d7995c1a353fe)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  mv -- "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
