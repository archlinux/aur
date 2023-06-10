# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=vision_msgs
_pkgname=vision_msgs
pkgname=ros2-humble-vision-msgs
pkgver=4.1.0
pkgrel=4
pkgdesc="Messages for interfacing with various computer vision pipelines, such as object detectors."
url="https://index.ros.org/p/vision_msgs/"
arch=('any')
depends=('ros2-humble')
makedepends=('cmake')
source=("https://github.com/ros-perception/vision_msgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2014c02d254b98206d3d3538bbe3c18e5cad3e45c925f4a12a492efc97c707c0')


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
