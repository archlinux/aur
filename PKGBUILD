# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=slack
pkgver=3.0.2
pkgrel=1
pkgdesc="Control your timer slack"
arch=(i686 x86_64)
url="https://github.com/maandree/slack"
license=('custom:ISC')
depends=('linux>=2.6.28')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(9999311df585e0863e55798204b9531a83a73f415ecd1c6584b9c1d964640c56)

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
