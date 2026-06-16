# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=pathie-cpp
pkgver=0.1.3
pkgrel=1
pkgdesc="Cross-platform pathname/filename manipulation library (kroketio fork, dependency of marian-lite)"
arch=('x86_64')
url="https://github.com/kroketio/pathie-cpp"
license=('BSD')
makedepends=('cmake')
source=("https://github.com/kroketio/pathie-cpp/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/pathie-cpp-${pkgver}"
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/pathie-cpp-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
