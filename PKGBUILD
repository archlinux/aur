# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=teleop_tools_msgs
pkgname=ros2-humble-teleop-tools-msgs
pkgver=1.3.0
pkgrel=2
pkgdesc="The teleop_tools_msgs package"
url="https://index.ros.org/p/teleop_tools_msgs/"
arch=('any')
depends=(
    'ros2-humble' 
)
source=("https://github.com/ros-teleop/teleop_tools/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('902e5fbdec909ee66e1b428df5076f125c231361211a1bd2a10b933fbc4d1f85')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S teleop_tools-$pkgver/$_pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
source /opt/ros/humble/setup.bash
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
