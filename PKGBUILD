# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=sleeping-getty
pkgver=1.2.1
pkgrel=1
pkgdesc="Do not start a fullblown getty before it is necessary"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/sleeping-getty"
license=('custom:ISC')
depends=()
makedepends=(linux-api-headers)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(e30f2c9b1c4681cc53cfda79866282fc8d5735406ec5df7f2cc00fe4f1ddb919)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  mv -- "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
