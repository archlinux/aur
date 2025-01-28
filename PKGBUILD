# Maintainer: Swarnava Ghosh <swarnavaghosh04@gmail.com>
pkgname=gr-gpredict-doppler
pkgver=1.0
pkgrel=1
pkgdesc="Relay information from GPredict to GNURadio"
arch=('x86_64')
url="https://github.com/ghostop14/gr-gpredict-doppler"
license=('Apache-2.0')
depends=('gnuradio')
makedepends=('cmake')
source=("git+${url}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}"
    mkdir build
    cd build
    cmake ..
    make
}

package() {
    cd "${pkgname}/build"
    make install DESTDIR="$pkgdir"
}
