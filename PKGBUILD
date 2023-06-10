# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=control_msgs
_pkgname=control_msgs
pkgname=ros2-humble-control-msgs
pkgver=4.1.1
pkgrel=2
pkgdesc="control_msgs contains base messages and actions useful for controlling robots. It provides representations for controller setpoints and joint and cartesian trajectories."
url="https://index.ros.org/p/control_msgs/"
arch=('any')
depends=('ros2-humble')
makedepends=('cmake')
source=("https://github.com/ros-controls/control_msgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ac3b5e1c1b1e04683b14f9a2600052bb0c5337f66222d31c292ea03c145ce915')


build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgroot-$pkgver/$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
