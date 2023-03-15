# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=ros2_control_test_assets
pkgname=ros2-humble-ros2-control-test-assets
pkgver=2.24.1
pkgrel=2
pkgdesc="The package provides shared test resources for ros2_control stack"
url="https://index.ros.org/p/ros2_control_test_assets/"
arch=('any')
depends=(
    'ros2-humble'
)
source=("https://github.com/ros-controls/ros2_control/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ceaa6c11965e2136d1a511584bdaf5694f1e665429860ccac8b65f59230e14b2')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S ros2_control-$pkgver/$_pkgname -B build \
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
