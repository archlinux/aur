# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=unstickpixels
pkgver=3.0.1
pkgrel=1
pkgdesc="Screen loop to try to unstick stuck dots"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/unstickpixels"
license=('custom:ISC')
depends=(libgamma)
makedepends=(libgamma)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(ca79009a66e26d8044ac6c19f717f436a7be31abb097123fdf98c1a77876d738)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
