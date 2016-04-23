# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=plasma5-applets-yahoo-weather-widget
pkgver=5.2.0
pkgrel=1
pkgdesc="A simple weather widget that makes use of beloved Yahoo! Weather data"
arch=('any')
url="http://kde-apps.org/content/show.php/Yahoo%21+Weather+Widget?content=164194"
license=(GPL)
depends=('plasma-workspace' 'qt5-declarative')
makedepends=('extra-cmake-modules')
source=(https://github.com/librehat/com.librehat.yahooweather/archive/v$pkgver.tar.gz)
md5sums=('fb6e9dfaeeabfcd3ebb910cd5a7df728')

prepare() {
  cd com.librehat.yahooweather-$pkgver
  mkdir -p build
}

build() {
  cd com.librehat.yahooweather-$pkgver/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd com.librehat.yahooweather-$pkgver/build
  make DESTDIR="$pkgdir" install
}
