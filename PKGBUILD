# Maintainer: baraclese at gmail dot com
pkgname=lwtools
pkgver=4.16
pkgrel=1
pkgdesc="cross-development tools for the Motorola 6809 and Hitachi 6309 microprocessors"
url="http://www.lwtools.ca/"
arch=('x86_64')
license=('GPL3')
source=("http://www.lwtools.ca/releases/lwtools/lwtools-${pkgver}.tar.gz")
sha256sums=(e4de2be9cd2407036ffb45ae562d8df653a30776a2d838798e08cec558ee192a)

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
