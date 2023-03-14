# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=ruckig
pkgname=ros2-humble-ruckig
pkgver=0.9.2
pkgrel=1
pkgdesc="Core libraries used by MoveIt"
url="https://index.ros.org/p/ruckig/"
arch=('any')
makedepends=('cmake')
source=("https://github.com/pantor/ruckig/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9207db22604881b146ca2fbe79916ff4290c53eb5b46a0f3bbc606fb74bee13c')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S ruckig-$pkgver -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
