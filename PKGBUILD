# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-network-monitor
pkgver=1.7.3
pkgrel=2
pkgdesc="Plasma 5 applet that monitors network speed of currently active connections"
arch=(any)
url="http://kde-apps.org/content/show.php/Network+Monitor?content=169377"
license=(GPL)
depends=(plasma-workspace qt5-graphicaleffects ksysguard)
makedepends=(extra-cmake-modules)
source=("https://github.com/kotelnik/plasma-applet-network-monitor/archive/v$pkgver.tar.gz")
sha256sums=('dff78d58f04aea11c8083cf1897e3c4b62057a6829a6666402be7188c75e2be9')

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
