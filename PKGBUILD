# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=pr2_description
pkgname=ros2-humble-moveit-resources-pr2-description
pkgver=2.0.6
pkgrel=2
pkgdesc="PR2 Resources used for MoveIt! testing"
url="https://index.ros.org/p/moveit_resources_pr2_description/"
arch=('any')
depends=(
    'ros2-humble'
)
source=("https://github.com/ros-planning/moveit_resources/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('25d86930fd51927670ea3135ad398bc6b4a9ade2c6a629d63e02f818431a52ac')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S moveit_resources-$pkgver/$_pkgname -B build \
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
