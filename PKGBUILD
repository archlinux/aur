# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=setpgrp
pkgver=2.1.2
pkgrel=1
pkgdesc="Commands providing access to the setpgrp and getpgrp system calls"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/setpgrp"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(89b3a80407c94598fb6941225aacaa33c47f9e8f233c644c201ba17eace82a50)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
