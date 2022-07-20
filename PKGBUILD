# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=slack
pkgver=3.0.2
pkgrel=1
pkgdesc="Control your timer slack"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/slack"
license=('custom:ISC')
depends=('linux>=2.6.28')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1012498dd60dc6d43a4ceb21e9a32430f6a7d6545b702c04db2ce6bfd81daedd)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

check() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr check
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
