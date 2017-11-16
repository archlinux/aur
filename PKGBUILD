# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=autopasswd
pkgver=2
pkgrel=2
pkgdesc="Reproducable password generator"
url="https://github.com/maandree/autopasswd"
arch=(i686 x86_64)
license=(GPL3)
depends=(glibc libpassphrase argparser-c libkeccak)
makedepends=(glibc libpassphrase argparser-c libkeccak make coreutils gcc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(7bdad6b035c198808ce650a3b78bd6476fbcf9663a4913b2d6e1a68ef0b1c270)


build() {
    cd "$srcdir/autopasswd-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/autopasswd-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

