# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

pkgname=ros2-humble-xacro
pkgver=2.0.9
pkgrel=1
pkgdesc="A tool to construct shorter and more readable XML files by using macros that expand to larger XML expressions"
url="https://index.ros.org/p/xacro/"
arch=('any')
depends=(
    'ros2-humble'
    'python-yaml'
)
source=("https://github.com/ros/xacro/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a8802a5b48f7479bae1238e822ac4ebb47660221eb9bc40a608e899d60f3f7e4')

prepare() {
    source /opt/ros/humble/setup.bash

    cmake -S xacro-$pkgver -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/ros/humble
}

build() {
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build install
}
