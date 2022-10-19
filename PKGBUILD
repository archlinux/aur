# Maintainer: Grzegorz Alibożek <grzegorz.alibozek@gmail.com>
_gitname="weather-widget-2"
pkgname=plasma5-applets-weather-widget-2
pkgver=2.3.4
pkgrel=1
pkgdesc="An updated version of the plasma-applet-weather-widget by Kotelnik"
arch=('x86_64')
url="https://github.com/blackadderkate/$_gitname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects' 'qt5-xmlpatterns')
makedepends=('extra-cmake-modules')
source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('8237457d8ae4a22072416b6ede3c9960ce721d2ebba8bcc221cad92bb109f03f')

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
