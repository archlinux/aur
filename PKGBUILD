# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-network-monitor
pkgver=1.6.0
pkgrel=1
pkgdesc="Plasma 5 applet that monitors network speed of currently active connections"
arch=(any)
url="http://kde-apps.org/content/show.php/Network+Monitor?content=169377"
license=(GPL)
depends=(plasma-nm qt5-graphicaleffects)
makedepends=(extra-cmake-modules)
source=("https://github.com/kotelnik/plasma-applet-network-monitor/archive/v$pkgver.tar.gz")
md5sums=('6fe3fb127e7759fc0f3dfd03d14d4c3a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-applet-network-monitor-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
