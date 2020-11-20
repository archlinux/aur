# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=finalcut
pkgver=0.7.1
pkgrel=1
pkgdesc="A text-based widget toolkit."
arch=('x86_64')
url="https://github.com/gansm/finalcut"
license=('LGPL3')
depends=('gpm')
makedepends=('autoconf-archive')
source=("${url}/archive/$pkgver.tar.gz")
sha256sums=('d85bfffa9481ac4647e07c4a6d824da5560509541966db69f59ebc214efcbee2')

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
