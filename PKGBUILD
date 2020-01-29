# Maintainer: Carson Black <uhhadd AT gmail DOT com>
pkgname=ikona
pkgver=0.7.1
pkgrel=1
pkgdesc="Icon preview designed for Plasma"
arch=(any)

url="https://invent.kde.org/KDE/ikona"
license=("GPL")

depends=(
    "kirigami2" "plasma-framework" "qt5-base" "qt5-quickcontrols2" "qt5-declarative"
    "qt5-webengine"
)
makedepends=(
    "cmake"
)

source=("https://invent.kde.org/kde/ikona/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('71643037824ded39cac9cdc6ab6b0217')

prepare() {
    mkdir -p build && cd build
}

build() {
    cd build
    cmake ../$pkgname-v$pkgver \
        -DCMAKE_INSTALL_LIBEXECDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
