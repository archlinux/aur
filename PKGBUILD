# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=navigation2
_pkgname=nav2_behavior_tree
pkgname=ros2-humble-nav2-behavior-tree
pkgver=1.1.7
pkgrel=1
pkgdesc="TODO"
url="https://index.ros.org/p/nav2_behavior_tree/"
arch=('any')
makedepends=(
    'ros2-humble-nav2-common'
    'cmake'
)
depends=(
    'ros2-humble' 
    'ros2-humble-behaviortree-cpp-v3'
    'ros2-humble-nav2-msgs'
    'ros2-humble-nav2-util'
)
source=("https://github.com/ros-planning/navigation2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1d89dc1ad7c75d4d1645c882a5aee037ca965908344a158bb9669ad80a85196b')

prepare() {
    source /opt/ros/humble/setup.bash
}

build() {
    cmake -B build -S "$_pkgroot-$pkgver/$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
