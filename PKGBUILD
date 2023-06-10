# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=ros2_control
_pkgname=controller_manager_msgs
pkgname=ros2-humble-controller-manager-msgs
pkgver=2.26.0
pkgrel=2
pkgdesc="Messages and services for the controller manager"
url="https://index.ros.org/p/controller_manager_msgs/"
arch=('any')
depends=(
    'ros2-humble'
)
makedepends=('cmake')
source=("https://github.com/ros-controls/ros2_control/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bb8b1233fa6db7dd2f56cf350c9ef9c5750f83e212df62981480a2453656f0cf')


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
