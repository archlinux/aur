# Maintainer: jacko <obri.jack.02 at gmail dot com>
# Contributor: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=vision_msgs
_pkgname=vision_msgs
pkgname=ros2-humble-vision-msgs
pkgver=4.1.1
pkgrel=1
license=('Apache-2.0')
pkgdesc="Messages for interfacing with various computer vision pipelines, such as object detectors."
url="https://index.ros.org/p/vision_msgs/"
arch=('any')
depends=('ros2-humble')
makedepends=('cmake')
# Syntax for renaming the source tarball, to ensure it has a unique filename.
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros-perception/vision_msgs/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1f54c590e5195dc3112e682eaf0abab47d244bc739e61102bdf183a8fe79f124')


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
