# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=finalcut
pkgver=0.9.0
pkgrel=1
pkgdesc="A text-based widget toolkit."
arch=('x86_64')
url="https://github.com/gansm/finalcut"
license=('LGPL3')
depends=('gpm')
makedepends=('autoconf-archive')
source=("${url}/archive/$pkgver.tar.gz")
sha256sums=('73ff5016bf6de0a5d3d6e88104668b78a521c34229e7ca0c6a04b5d79ecf666e')

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
