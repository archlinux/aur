# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=cpp_polyfills
_pkgname=tcb_span
pkgname=ros2-humble-tcb-span
pkgver=1.0.2
pkgrel=4
pkgdesc="Implementation of C++20's std::span"
url="https://index.ros.org/p/tcb_span/"
arch=('any')
depends=(
    'ros2-humble' 
)
makedepends=('cmake')
source=("https://github.com/PickNikRobotics/cpp_polyfills/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b7dde11bd51f5a7ded145fbc9a66b5ec304063117da73e19212757cb39830c21')


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
