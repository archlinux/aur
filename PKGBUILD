# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>
pkgname=plasma5-wallpapers-dynamic
pkgver=3.1.0
pkgrel=1
pkgdesc="Dynamic wallpaper plugin for KDE Plasma"
arch=(x86_64)
url="https://github.com/zzag/plasma5-wallpapers-dynamic"
license=('GPL')
depends=(kio libheif plasma-framework qt5-base qt5-declarative qt5-location)
makedepends=(cmake extra-cmake-modules)
optdepends=('geoclue: automatic location detection support')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('792766d7801f8fba28fce8a3b5988f9ac366aaef12d797215587f03e32d379f2')

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
