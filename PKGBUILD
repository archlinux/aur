# Maintainer: Grzegorz Alibożek <grzegorz.alibozek@gmail.com>
_gitname="weather-widget-2"
pkgname=plasma5-applets-weather-widget-2
pkgver=2.3.2.1
pkgrel=1
pkgdesc="An updated version of the plasma-applet-weather-widget by Kotelnik"
arch=('x86_64')
url="https://github.com/blackadderkate/$_gitname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects' 'qt5-xmlpatterns')
makedepends=('extra-cmake-modules')
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('3cf851bad8dcbdfa4d6498b47dfbfda3a4b6b836e9fdb8a790b210b75f14d207')

build() {
    cmake -B ./build -S ./${_gitname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
    make -C ./build DESTDIR="$pkgdir" install
}
