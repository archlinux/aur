# Maintainer: baraclese at gmail dot com
pkgname=lwtools
pkgver=4.17
pkgrel=1
pkgdesc="cross-development tools for the Motorola 6809 and Hitachi 6309 microprocessors"
url="http://www.lwtools.ca/"
arch=('x86_64')
license=('GPL3')
source=("http://www.lwtools.ca/releases/lwtools/lwtools-${pkgver}.tar.gz")
sha256sums=(a93ab316ca0176901822873dba4bc286d3a5cf86e6a853d3edb7a51ecc96a91c)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make test
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export INSTALLDIR="${pkgdir}/usr/bin"
    make install
}
