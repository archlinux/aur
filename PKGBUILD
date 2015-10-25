# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Martin Kostolný <clearmartin at zoho dot com>

pkgname=plasma5-applets-weather-widget
pkgver=1.5.1
pkgrel=1
pkgdesc="Plasma 5 applet for displaying weather information from yr.no server"
arch=(any)
url="http://kde-apps.org/content/show.php/Weather+Widget?content=169572"
license=(GPL)
depends=(plasma-workspace qt5-graphicaleffects)
makedepends=(extra-cmake-modules)
source=("https://github.com/kotelnik/plasma-applet-weather-widget/archive/v$pkgver.tar.gz")
md5sums=('4f13a6c37297b58c42e23117eec49c84')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-applet-weather-widget-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
