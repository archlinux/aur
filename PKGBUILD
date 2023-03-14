# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=vision_msgs
pkgname=ros2-humble-vision-msgs
pkgver=4.1.0
pkgrel=1
pkgdesc="Messages for interfacing with various computer vision pipelines, such as object detectors."
url="https://index.ros.org/p/vision_msgs/"
arch=('any')
depends=('ros2-humble')
source=("https://github.com/ros-perception/vision_msgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2014c02d254b98206d3d3538bbe3c18e5cad3e45c925f4a12a492efc97c707c0')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S vision_msgs-$pkgver/$_pkgname -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
