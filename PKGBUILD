# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=srdfdom
pkgname=ros2-humble-srdfdom
pkgver=2.0.4
pkgrel=2
pkgdesc="Parser for Semantic Robot Description Format (SRDF)"
url="https://index.ros.org/p/srdfdom/"
arch=('any')
depends=(
    'ros2-humble'
    'boost'
    'console-bridge'
    'tinyxml2'
    'urdfdom'
    'urdfdom-headers'
    'ros2-humble-urdf-parser-py'
)
source=("https://github.com/ros-planning/srdfdom/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1a4077dc594ee0aed14775753b8ed0699d0f2d5defae0d5c2ff90081d93122c3')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S srdfdom-$pkgver -B build \
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
