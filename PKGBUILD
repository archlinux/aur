# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-active-window-control
pkgver=1.7.3
pkgrel=3
pkgdesc="Plasma applet for controlling the currently active window"
arch=(x86_64)
url="https://github.com/kotelnik/plasma-applet-active-window-control"
license=(GPL2)
depends=(plasma-workspace qt5-graphicaleffects)
makedepends=(extra-cmake-modules)
source=($pkgname-$pkgver.tar.gz::"https://github.com/kotelnik/plasma-applet-active-window-control/archive/v$pkgver.tar.gz")
sha256sums=('f4662560bffd57155081fb8bb0d82c118204f578c7c681b442e365b6c7d169a9')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-applet-active-window-control-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
