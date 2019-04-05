# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
_pkgname=dynamic-wallpaper
pkgname=plasma5-wallpapers-dynamic
pkgver=1.6
pkgrel=1
pkgdesc="Dynamic wallpaper plugin for KDE Plasma"
arch=(x86_64)
url="https://github.com/zzag/dynamic-wallpaper"
license=('GPL')
depends=(plasma-framework qt5-base qt5-declarative)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('6af41e74a69c9794dc0aa7b526f27a44b6bbe8010c6793bb18f7c6e777387b07')

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
