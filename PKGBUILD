# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=ruckig
pkgname=ros2-humble-ruckig
pkgver=0.9.2
pkgrel=4
pkgdesc="Core libraries used by MoveIt"
url="https://index.ros.org/p/ruckig/"
arch=('any')
makedepends=('cmake')
source=("https://github.com/pantor/ruckig/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9207db22604881b146ca2fbe79916ff4290c53eb5b46a0f3bbc606fb74bee13c')


build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
