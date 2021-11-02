# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=finalcut
pkgver=0.8.0
pkgrel=1
pkgdesc="A text-based widget toolkit."
arch=('x86_64')
url="https://github.com/gansm/finalcut"
license=('LGPL3')
depends=('gpm')
makedepends=('autoconf-archive')
source=("${url}/archive/$pkgver.tar.gz")
sha256sums=('0bb4de87df2c466d5ba6513cadcb691a3387e60884c65c7bd158e8350f7f4829')

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
