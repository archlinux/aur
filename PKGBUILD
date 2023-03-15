# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=random_numbers
pkgname=ros2-humble-random-numbers
pkgver=2.0.1
pkgrel=2
pkgdesc="This library contains wrappers for generating floating point values, integers, quaternions using boost libraries."
url="https://index.ros.org/p/random_numbers/"
arch=('any')
depends=(
    'ros2-humble'
    'boost'
)
source=("https://github.com/ros-planning/random_numbers/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bbdc63312131245e69d590ada5adf9f741b4da084541e40091886f3cb83f83a6')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S random_numbers-$pkgver -B build \
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
