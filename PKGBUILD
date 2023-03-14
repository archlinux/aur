# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=control_msgs
pkgname=ros2-humble-control-msgs
pkgver=4.1.0
pkgrel=1
pkgdesc="control_msgs contains base messages and actions useful for controlling robots. It provides representations for controller setpoints and joint and cartesian trajectories."
url="https://index.ros.org/p/control_msgs/"
arch=('any')
depends=('ros2-humble')
source=("https://github.com/ros-controls/control_msgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2437e01bbe3621b1faf6686d7147d7ac79628a6ea42ba4be23de4a7f270511c4')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S control_msgs-$pkgver/$_pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
