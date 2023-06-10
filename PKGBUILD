# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=moveit_resources
_pkgname=panda_description
pkgname=ros2-humble-moveit-resources-panda-description
pkgver=2.0.6
pkgrel=4
pkgdesc="panda Resources used for MoveIt testing"
url="https://index.ros.org/p/panda_description/"
arch=('any')
depends=(
    'ros2-humble'
)
makedepends=('cmake')
source=("https://github.com/ros-planning/moveit_resources/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('25d86930fd51927670ea3135ad398bc6b4a9ade2c6a629d63e02f818431a52ac')


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
