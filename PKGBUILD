# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=nav2_dwb_controller/nav_2d_msgs
pkgname=ros2-humble-nav-2d-msgs
pkgver=1.1.6
pkgrel=2
pkgdesc="Basic message types for two dimensional navigation, extending from geometry_msgs::Pose2D.<"
url="https://index.ros.org/p/nav_2d_msgs/"
arch=('any')
depends=(
    'ros2-humble'
)
source=("https://github.com/ros-planning/navigation2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('43abfa0eba8e3862e9f69e39399b0b6b627d2fa44faede494b09b7ee8c2626c1')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S navigation2-$pkgver/$_pkgname -B build \
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
