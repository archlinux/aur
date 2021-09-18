# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=setpgrp
pkgver=2.1.1
pkgrel=1
pkgdesc="Commands providing access to the setpgrp and getpgrp system calls"
arch=(i686 x86_64)
url="https://github.com/maandree/setpgrp"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8d5a9bd824de6054a81642c351b659fd25fb5e7ab392e98859c709186095743c)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
