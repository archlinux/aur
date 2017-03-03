# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-active-window-control
pkgver=1.7.1
pkgrel=1
pkgdesc="Plasma applet for controlling the currently active window"
arch=(i686 x86_64)
url="https://github.com/kotelnik/plasma-applet-active-window-control"
license=(GPL2)
depends=(plasma-workspace qt5-graphicaleffects)
makedepends=(extra-cmake-modules)
source=($pkgname-$pkgver.tar.gz::"https://github.com/kotelnik/plasma-applet-active-window-control/archive/v$pkgver.tar.gz")
sha256sums=('83f9f2d255b679f425c7c9fd73b014807cac3235b13e8273c593fbd312c4bd01')

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
