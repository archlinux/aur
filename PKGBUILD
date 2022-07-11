# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=qpwgraph-qt5
pkgver=0.3.4
pkgrel=1
pkgdesc="a pipewire graph using qt(qt5 version)"
arch=('x86_64')
url="https://gitlab.freedesktop.org/rncbc/qpwgraph"
license=('GPL')
depends=('alsa-lib' 'pipewire' 'qt5-base' 'qt5-svg' 'hicolor-icon-theme')
makedepends=('cmake')
provides=('qpwgraph')
conflicts=('qpwgraph')
source=("$url/-/archive/v$pkgver/${pkgname%-qt5}-v$pkgver.tar.gz")
sha256sums=('8a4bda560e6e44bb399a8ed6b5d26996780e0194579e6bcd8fc8971be9b75252')

build() {
cmake -B build -S "${pkgname%-qt5}-v$pkgver" -DCMAKE_BUILD_TYPE=None \
 -DCMAKE_INSTALL_PREFIX=/usr -DCONFIG_WAYLAND=ON \
 -DCONFIG_QT6=OFF
 cmake --build build
}

package() {
DESTDIR="$pkgdir" cmake --install build
}
