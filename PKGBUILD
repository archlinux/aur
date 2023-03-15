# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=angles
pkgname=ros2-humble-angles
pkgver=1.15.0
pkgrel=2
pkgdesc="This package provides a set of simple math utilities to work with angles"
url="https://index.ros.org/p/angles/"
arch=('any')
makedepends=('python-setuptools')
depends=('ros2-humble')
source=("https://github.com/ros/angles/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3467a8f5bcc893104f036fad63f3fe44af3a13aae0592d4ae5b24c0dfa520293')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S angles-$pkgver/$_pkgname -B build \
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
