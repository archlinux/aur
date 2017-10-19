# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=slack
pkgver=3.0
pkgrel=1
pkgdesc="Control your timer slack"
arch=(i686 x86_64)
url="https://github.com/maandree/slack"
license=('custom:ISC')
depends=('linux>=2.6.28')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(ed27148d2fe8d08b6a8c83c6dcad2073e9e4da7ebc3fcdc6a9883b3768cbd5b4)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
