# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
_pkgname=dynamic-wallpaper
pkgname=plasma5-wallpapers-dynamic
pkgver=1.8
pkgrel=1
pkgdesc="Dynamic wallpaper plugin for KDE Plasma"
arch=(x86_64)
url="https://github.com/zzag/dynamic-wallpaper"
license=('GPL')
depends=(plasma-framework qt5-base qt5-declarative)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('b0f1c7b5d50bfd5bc80b50166422e58b2a055accc965088bf7edfc06f75a1c2a')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$_pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
