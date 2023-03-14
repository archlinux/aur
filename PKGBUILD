# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=navigation2
pkgname=ros2-humble-navigation2
pkgver=1.1.6
pkgrel=1
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
source=("https://github.com/ros-planning/navigation2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('43abfa0eba8e3862e9f69e39399b0b6b627d2fa44faede494b09b7ee8c2626c1')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S navigation2-$pkgver/$_pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
