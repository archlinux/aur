# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=raplcap
pkgver=0.8.0
pkgrel=1
pkgdesc="RAPL power capping C interface with multiple implementations"
arch=('x86_64')
url="https://github.com/powercap/raplcap"
license=('BSD-3')
depends=('powercap' 'cmake')
source=(https://github.com/powercap/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('3ea2cc32142f4aafb499943ca75909e72d6ab06a29c80c3f46b8c0175f44ae6be061f634f0ec0fc62a26f461ede237de690eb5afb3a7967e4b638e9756dae566')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir _build
    cd _build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
     cd "${srcdir}/${pkgname}-${pkgver}"
     cd _build
     make DESTDIR="${pkgdir}" install
}
