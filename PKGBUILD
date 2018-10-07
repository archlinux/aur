# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>
pkgname=libics
pkgver=1.6.2
pkgrel=1
pkgdesc='Image Cytometry Standard file reading and writing.'
arch=(i686 x86_64)
url=https://svi-opensource.github.io/libics/
license=(LGPL2.1)
depends=(zlib)
source=(https://github.com/svi-opensource/libics/archive/${pkgver}.tar.gz)
sha256sums=('0dfe1a00579d9e320e2bd81137cee4b534e971c35964ec99656a9410cc45a84a')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
