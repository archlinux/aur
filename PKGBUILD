# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=raplcap
pkgver=0.7.0
pkgrel=1
pkgdesc="RAPL power capping C interface with multiple implementations"
arch=('x86_64')
url="https://github.com/powercap/raplcap"
license=('BSD-3')
depends=('powercap' 'cmake')
source=(https://github.com/powercap/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('5f049e6dfa97491f2bab732e2592c4cf8902ec200c9b3a5752b60b30364c74dadb4aff2312ea40037c214ca2e2ec795e6a16e37b653f2bfa0baa144c771c2455')

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
