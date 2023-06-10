# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=cpp_polyfills
_pkgname=tl_expected
pkgname=ros2-humble-tl-expected
pkgver=1.0.2
pkgrel=4
pkgdesc="C++11/14/17 std::expected with functional-style extensions"
url="https://index.ros.org/p/tl_expected/"
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
