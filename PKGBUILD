# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:

pkgname=openvkl
pkgver=0.11.0
pkgrel=1
pkgdesc="A collection of high-performance volume computation kernels, developed at Intel"
arch=(x86_64)
url="https://www.ospray.org/"
license=(Apache)
depends=(embree rkcommon-git glfw)
makedepends=(cmake ispc)
source=("https://github.com/openvkl/openvkl/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2854f270b34d310b9a9d47deb00cc6897038707fac75b427dbf81602ee1b2136')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../${pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build .
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
