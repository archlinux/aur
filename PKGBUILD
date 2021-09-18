# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=unstickpixels
pkgver=3.0.1
pkgrel=1
pkgdesc="Screen loop to try to unstick stuck dots"
arch=(i686 x86_64)
url="https://github.com/maandree/unstickpixels"
license=('custom:ISC')
depends=(libgamma)
makedepends=(libgamma)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(35791a04a10657f77114b19a7db992258d85521888778609f364c3015c7c7452)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
