# Maintainer: Vlad Zagorodniy <vladzzag@gmail.com>
_pkgname=dynamic-wallpaper
pkgname=plasma5-wallpapers-dynamic
pkgver=1.4
pkgrel=1
pkgdesc="Dynamic wallpaper plugin for KDE Plasma"
arch=(x86_64)
url="https://github.com/zzag/dynamic-wallpaper"
license=('GPL')
depends=(plasma-framework qt5-base qt5-declarative)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('93aa9d45a3ef99ec492659c39c03021fd0287e316a810a7178fb2a9fa71878c3')

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
