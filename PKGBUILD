# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongotimer
pkgver=1.1
pkgrel=1
pkgdesc='A humongous timer or stopwatch for the terminal'
arch=(any)
url='https://github.com/maandree/mongotimer'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(db9155e009e84ba753559fbe4e073e66ef55657ffbfeb6ab493b8285463a4a23)

build() {
    cd "$srcdir/mongotimer-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongotimer-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
