# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=vtchs
pkgver=1.1
pkgrel=1
pkgdesc="Listen for VT switches"
arch=(i686 x86_64)
url="https://github.com/maandree/vtchs"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(fb7cb42fc796eea4c86bb53d7257503cd73b033bf76962b420609c5b8351a37f)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
