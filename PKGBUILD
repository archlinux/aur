# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=moveit_msgs
pkgname=ros2-humble-moveit-msgs
pkgver=2.2.1
pkgrel=4
epoch=1
pkgdesc="Messages, services and actions used by MoveIt"
url="https://index.ros.org/p/moveit_msgs/"
arch=('any')
depends=(
    'ros2-humble'
    'ros2-humble-object-recognition-msgs'
    'ros2-humble-octomap-msgs'
)
makedepends=('cmake')
source=("https://github.com/ros-planning/moveit_msgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('19fe10af4ab1e236206886c66824beab1bfe9e295d37a2a47c51b65c5199b4aa')


build() {
    source /opt/ros/humble/setup.bash
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
