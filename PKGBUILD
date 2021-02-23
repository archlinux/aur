# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=setpgrp
pkgver=2.1
pkgrel=1
pkgdesc="Commands providing access to the setpgrp and getpgrp system calls"
arch=(i686 x86_64)
url="https://github.com/maandree/setpgrp"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(c6511283fd46bfee856f26dcf114994486ef2c6467ef673d72ad78c3f5a49739)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
