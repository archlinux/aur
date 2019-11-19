# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz at gmail dot com>
# ---------------------------------------------------------------

pkgname=opencpn-plugin-weatherrouting
pkgver=1.10.1
pkgrel=2
pkgdesc="Weather routing plugin for OpenCPN"
arch=('x86_64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/weatherroute.html"
source=("https://github.com/seandepagnier/weather_routing_pi/archive/v${pkgver}.tar.gz")
sha1sums=('be3c5d7ee096aa19767cd0c7cf851186785ac387')

build() {
  cd "weather_routing_pi-${pkgver}"
  mkdir -p build
  cd build
  cmake -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 ..
  make
}

package() {
  cd "weather_routing_pi-${pkgver}/build"
  DESTDIR="$pkgdir" make install
}
