# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongotimer
pkgver=1.0
pkgrel=1
pkgdesc='A humongous timer or stopwatch for the terminal'
arch=(any)
url='https://github.com/maandree/mongotimer'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(cfb8d601804af0132e67d5d7187c7ba227d3bf88b87b6dded684ec4bff1e4a40)

build() {
    cd "$srcdir/mongotimer-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongotimer-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
