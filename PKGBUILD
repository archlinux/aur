# Maintainer: insmtr <insmtr@insmtr.cn>
# Contributor: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=eigen_stl_containers
pkgname=ros2-humble-eigen-stl-containers
pkgver=1.1.0
pkgrel=1
pkgdesc="This package provides a set of typedef's that allow using Eigen datatypes in STL containers"
url="https://index.ros.org/p/eigen_stl_containers/"
arch=('any')
depends=(
    'ros2-humble'
    'eigen'
)
makedepends=('cmake')
source=("https://github.com/ros/eigen_stl_containers/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('75f92ead9cd97e7ac54a4c148cf1d419c1facf087d702b0241e3e5a968c1590e')


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
