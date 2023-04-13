# Maintainer: If_Return <yzc2004.12@gmail.com>

_pkgname=ackermann_msgs
pkgname=ros2-humble-ackermann-msgs
pkgver=2.0.2
pkgrel=1
pkgdesc="ROS messages for vehicles using front-wheel Ackermann steering. It was defined by the ROS Ackermann steering group."
url="https://index.ros.org/r/ackermann_msgs/"
arch=('any')
depends=('ros2-humble')
source=("https://github.com/ros-drivers/ackermann_msgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('26321df1bc2855adbcefac0a32091ce843271d93791fceff914a3f4c7b06d269')
prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S ackermann_msgs-$pkgver -B build \
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
