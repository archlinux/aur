# Maintainer: Howetuft <howetuft@gmail.com>
# Contributor:

pkgname=openvkl
pkgver=0.12.0
pkgrel=1
pkgdesc="A collection of high-performance volume computation kernels, developed at Intel"
arch=(x86_64)
url="https://www.ospray.org/"
license=(Apache)
depends=(embree rkcommon-git glfw)
makedepends=(cmake ispc)
source=("https://github.com/openvkl/openvkl/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('130e7cbc20319c3af2fc11b7579ef2a756315170db43ae81de1aa9b43529a9a2')

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
