# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=finalcut
pkgver=0.9.1
pkgrel=1
pkgdesc="A text-based widget toolkit."
arch=('x86_64')
url="https://github.com/gansm/finalcut"
license=('LGPL3')
depends=('gpm')
makedepends=('autoconf-archive')
source=("${url}/archive/$pkgver.tar.gz")
sha256sums=('6593b3c43ba1de98e4e0e3a563dbf9316fade71ef85c82e6b6f086184ec69a56')

prepare() {
    cd "$pkgname-$pkgver"
    autoreconf -if
    ./configure --prefix=/usr
}

build() {
    cd "$pkgname-$pkgver"
    make
}

check() {
    cd "$pkgname-$pkgver"
    make check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

# vim: set softtabstop=4 shiftwidth=4 expandtab:
