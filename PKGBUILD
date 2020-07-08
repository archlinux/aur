# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>
pkgname=plasma5-wallpapers-dynamic
pkgver=3.2.1
pkgrel=1
pkgdesc="Dynamic wallpaper plugin for KDE Plasma"
arch=(x86_64)
url="https://github.com/zzag/plasma5-wallpapers-dynamic"
license=('GPL')
depends=(libexif libheif plasma-framework qt5-base qt5-declarative qt5-location)
makedepends=(cmake extra-cmake-modules)
optdepends=('geoclue: automatic location detection support')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('7c51ec1416d3cf4566281d9aaad91b7644c914eb7275472f6c82f8dd97760772')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
