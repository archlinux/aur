# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
_pkgname=dynamic-wallpaper
pkgname=plasma5-wallpapers-dynamic
pkgver=1.7
pkgrel=1
pkgdesc="Dynamic wallpaper plugin for KDE Plasma"
arch=(x86_64)
url="https://github.com/zzag/dynamic-wallpaper"
license=('GPL')
depends=(plasma-framework qt5-base qt5-declarative)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('441bc14e83b763703ed9b2d9f5ea61879fffa77f2a81ef4c7f0342fd6fe09ab2')

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
