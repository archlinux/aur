# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=mongoclock
pkgver=3.1
pkgrel=1
pkgdesc='Just a humongous clock for the terminal'
arch=(any)
url='https://github.com/maandree/mongoclock'
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(aa63e1d959949553d1e0dff320d1149739b4e3e51724ce1e26517b83a259ec85)

build() {
    cd "$srcdir/mongoclock-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/mongoclock-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
