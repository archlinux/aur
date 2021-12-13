# Maintainer: Leo sk <sk.griffinix@gmail.com>
pkgname=kde-rounded-corners
pkgver=1.0
pkgrel=1.0
pkgdesc="Round the corners of windows"
arch=('x86_64')
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=('GPL3')
depends=(kwin)
makedepends=(extra-cmake-modules cmake qt5-tools kinit git)
source=(git+https://github.com/matinlotfali/KDE-Rounded-Corners)
sha256sums=('SKIP')

prepare() {
    mkdir -p qt5build
}

build() {
    cd qt5build
    cmake ../KDE-Rounded-Corners/ -DCMAKE_INSTALL_PREFIX=/usr -DQT5BUILD=ON
    make
}

package() {
    cd qt5build
    make DESTDIR="$pkgdir" install
}
