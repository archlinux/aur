# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=stepcode
pkgver=0.8.2
pkgrel=1
pkgdesc="Data exchange with ISO 10303. Used with IFC, STEP, and other standards
to exchange data wit C++ and Python."
arch=('i686' 'x86_64')
url="https://stepcode.github.io"
license=('BSD 3-Clause')
depends=('gcc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stepcode/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a0307185313a55e127db4476bf234b9ea90edfeee6ac7a57923f7608a48d91e5')

build() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DSC_IS_SUBBUILD=false

    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}/" install
}
