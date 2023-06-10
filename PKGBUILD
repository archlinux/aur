# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=srdfdom
pkgname=ros2-humble-srdfdom
pkgver=2.0.4
pkgrel=4
pkgdesc="Parser for Semantic Robot Description Format (SRDF)"
url="https://index.ros.org/p/srdfdom/"
arch=('any')
depends=(
    'ros2-humble'
    'boost-libs'
    'console-bridge'
    'tinyxml2'
    'urdfdom'
    'urdfdom-headers'
    'ros2-humble-urdf-parser-py'
)
makedepends=(
    'boost'
    'cmake'
)
source=("https://github.com/ros-planning/srdfdom/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1a4077dc594ee0aed14775753b8ed0699d0f2d5defae0d5c2ff90081d93122c3')


build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$_pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
