# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

pkgname=ros2-humble-object-recognition-msgs
pkgver=2.0.0
pkgrel=1
pkgdesc="Messages, services and actions used by MoveIt"
url="https://index.ros.org/p/object_recognition_msgs/"
arch=('any')
depends=(
    'ros2-humble'
)
source=("https://github.com/wg-perception/object_recognition_msgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('49b39e5ef897ac9a6ab1f5b9c7fe9f1e10d954f5bdc3bdceee65883afa70b8c7')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S object_recognition_msgs-$pkgver -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
