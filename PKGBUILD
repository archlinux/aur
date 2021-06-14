# Maintainer: Daniel Menelkir <menelkir at itroll dot org>

pkgname=raplcap
pkgver=0.6.0
pkgrel=1
pkgdesc="RAPL power capping C interface with multiple implementations"
arch=('x86_64')
url="https://github.com/powercap/raplcap"
license=('BSD-3')
depends=('powercap' 'cmake')
source=(https://github.com/powercap/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('196625e2027b06421615705255c7f2603eed86b70fec2aa97cdc597a59b5e1217067f5ea1eb4ea62cfcf64f14510addc953cfca6838593d5d09226b6019901a7')

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
