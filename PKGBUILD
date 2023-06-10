# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=navigation2
_pkgname=navigation2
pkgname=ros2-humble-navigation2
pkgver=1.1.7
pkgrel=2
pkgdesc="ROS2 Navigation Stack"
url="https://index.ros.org/p/navigation2/"
arch=('any')
depends=(
    'ros2-humble' 
    'ros2-humble-nav2-amcl'
    'ros2-humble-nav2-behavior-tree'
    'ros2-humble-nav2-bt-navigator'
    'ros2-humble-nav2-collision-monitor'
    'ros2-humble-nav2-constrained-smoother'
    'ros2-humble-nav2-controller'
    'ros2-humble-nav2-core'
    'ros2-humble-nav2-costmap-2d'
    'ros2-humble-nav2-dwb-controller'
    'ros2-humble-nav2-lifecycle-manager'
    'ros2-humble-nav2-map-server'
    'ros2-humble-nav2-msgs'
    'ros2-humble-nav2-navfn-planner'
    'ros2-humble-nav2-planner'
    'ros2-humble-nav2-behaviors'
    'ros2-humble-nav2-smoother'
    'ros2-humble-nav2-regulated-pure-pursuit-controller'
    'ros2-humble-nav2-rotation-shim-controller'
    'ros2-humble-nav2-rviz-plugins'
    'ros2-humble-nav2-simple-commander'
    'ros2-humble-nav2-smac-planner'
    'ros2-humble-nav2-smoother'
    'ros2-humble-nav2-theta-star-planner'
    'ros2-humble-nav2-util'
    'ros2-humble-nav2-velocity-smoother'
    'ros2-humble-nav2-voxel-grid'
    'ros2-humble-nav2-waypoint-follower'
)
makedepends=('cmake')
source=("https://github.com/ros-planning/navigation2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1d89dc1ad7c75d4d1645c882a5aee037ca965908344a158bb9669ad80a85196b')


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
