# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongoclock
pkgver=3.0
pkgrel=1
pkgdesc='Just a humongous clock for the terminal'
arch=(any)
url='https://github.com/maandree/mongoclock'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(8d3e43dd1d029a3bf0152d0f2606864395198d27651bc2ca6a800c2c9a088659)

build() {
    cd "$srcdir/mongoclock-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongoclock-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
