# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=setpgrp
pkgver=2.1.1
pkgrel=1
pkgdesc="Commands providing access to the setpgrp and getpgrp system calls"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/setpgrp"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8a781dbe2abcd52c5fb1c13bd6798d2be0d58df12b8bfec6badd96f5790f554f)

build() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
