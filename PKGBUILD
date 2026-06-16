# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=intgemm
pkgver=0.0.3
pkgrel=1
pkgdesc="Integer Matrix Multiplication library (kroketio fork, dependency of marian-lite)"
arch=('x86_64')
url="https://github.com/kroketio/intgemm"
license=('Apache')
makedepends=('cmake' 'git')
source=("https://github.com/kroketio/intgemm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/intgemm-${pkgver}"
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/intgemm-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
