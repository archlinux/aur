# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=play_motion2
_pkgname=play_motion2_msgs
pkgname=ros2-humble-play-motion2-msgs
pkgver=0.0.8
pkgrel=2
pkgdesc="associated messages to play and handle pre-recorded motions in ROS2"
url="https://github.com/pal-robotics/play_motion2/"
arch=('any')
depends=('ros2-humble')
makedepends=('cmake')
source=("https://github.com/pal-robotics/play_motion2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2cb01f576e8c06a5f5c75f75dc3e61c9fb8149041236fc8afd2061b9f09edac2')


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
