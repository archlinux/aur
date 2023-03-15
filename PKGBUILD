# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=eigen_stl_containers
pkgname=ros2-humble-eigen-stl-containers
pkgver=1.0.0
pkgrel=2
pkgdesc="This package provides a set of typedef's that allow using Eigen datatypes in STL containers"
url="https://index.ros.org/p/eigen_stl_containers/"
arch=('any')
depends=(
    'ros2-humble'
    'eigen'
)
source=("https://github.com/ros/eigen_stl_containers/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4780665fa22d7924072ae2fa22d98a32870becb15ce4e68c08c2de923a184583')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S eigen_stl_containers-$pkgver -B build \
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
