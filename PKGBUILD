# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=ifopt
pkgver=2.0.7
pkgrel=1
pkgdesc="An Eigen-based, light-weight C++ Interface to Nonlinear Programming
Solvers (Ipopt, Snopt)"
arch=('i686' 'x86_64')
url="https://github.com/ethz-adrl/ifopt"
license=('BSD 3-Clause')
depends=('eigen' 'coin-or-ipopt')
optdepends=()
makedepends=('cmake')
source=(https://github.com/ethz-adrl/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('0e8e5434c722fec40ec723f85416e08bfaed859d44f9acbf37685d88d4a7406d')

build() {

    msg "Starting CMake"

    # Create a build directory
    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX="/usr"

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
