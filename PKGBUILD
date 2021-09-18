# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongotimer
pkgver=1.1.4
pkgrel=1
pkgdesc='A humongous timer or stopwatch for the terminal'
arch=(any)
url='https://github.com/maandree/mongotimer'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(1099ffea5b7cebe6f4e6d13539f7b1b63dadfd9667729f27a71ec5da84ded3c1)

build() {
    cd "$srcdir/mongotimer-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongotimer-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
