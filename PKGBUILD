# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=object_recognition_msgs
pkgname=ros2-humble-object-recognition-msgs
pkgver=2.0.0
pkgrel=4
pkgdesc="Messages, services and actions used by MoveIt"
url="https://index.ros.org/p/object_recognition_msgs/"
arch=('any')
depends=(
    'ros2-humble'
)
makedepends=('cmake')
source=("https://github.com/wg-perception/object_recognition_msgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('49b39e5ef897ac9a6ab1f5b9c7fe9f1e10d954f5bdc3bdceee65883afa70b8c7')


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
