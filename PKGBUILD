pkgname=aocl-utils
pkgver=4.2
pkgrel=1
pkgdesc="AOCL-Utils provides a uniform interface to all the AOCL libraries to access the CPU features for AMD CPUs."
arch=('x86_64')
url="https://github.com/amd/aocl-utils"
license=('BSD')
depends=()
makedepends=('cmake')
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1294cdf275de44d3a22fea6fc4cd5bf66260d0a19abb2e488b898aaf632486bd')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr

    cd build
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}/build
    make DESTDIR=${pkgdir} install
}
