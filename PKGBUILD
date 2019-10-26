# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=lusol
pkgver=2016.1.26
pkgrel=1
pkgdesc="A sparse LU factorization for square and rectangular matrices."
arch=('i686' 'x86_64')
url="https://web.stanford.edu/group/SOL/software/lusol/"
license=('MIT/BSD')
depends=('gcc-libs')
optdepends=('')
makedepends=('gcc-libs')
_pkgver=2016-01-26
source=(https://github.com/nwh/${pkgname}/archive/build-${_pkgver}.tar.gz)
sha256sums=('f9ff04d8be7decfaa930b3052e2ca026ad977ff300b5f27a4088bdc16de279dc')

build() {

    cd "${srcdir}/${pkgname}-build-${_pkgver}"

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${pkgname}-build-${_pkgver}/src"

    msg "Installing files"

    # libraries
    mkdir -p ${pkgdir}/usr/lib
    cp clusol.o ${pkgdir}/usr/lib/
    cp libclusol.so ${pkgdir}/usr/lib/
    cp lusol.mod ${pkgdir}/usr/lib/
    cp lusol.mod ${pkgdir}/usr/lib/
    cp lusol.o ${pkgdir}/usr/lib/
    cp lusol6b.o ${pkgdir}/usr/lib/
    cp lusol7b.o ${pkgdir}/usr/lib/
    cp lusol8b.o ${pkgdir}/usr/lib/
    cp lusol_precision.mod ${pkgdir}/usr/lib/
    cp lusol_precision.o ${pkgdir}/usr/lib/
    cp lusol_util.o ${pkgdir}/usr/lib/

    # header
    mkdir -p ${pkgdir}/usr/include
    cp clusol.h ${pkgdir}/usr/include/

    # misc
    mkdir -p ${pkgdir}/usr/share
    cp README.md ${pkgdir}/usr/share/
    cp lusol.txt ${pkgdir}/usr/share/
}
