# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz at gmail dot com>
# ---------------------------------------------------------------

pkgname=opencpn-plugin-polar
pkgver=1.1008
pkgrel=2
pkgdesc="Polar creation plugin for OpenCPN"
arch=('x86_64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/polar.html"
source=("https://github.com/ptulp/polar_pi/archive/v${pkgver}.tar.gz")
sha1sums=('9354184d44b72fcd7932f83a7eba248a15307a9b')

build() {
  cd "polar_pi-${pkgver}"
  mkdir -p build
  cd build
  cmake -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 ..
  make
}

package() {
  cd "polar_pi-${pkgver}/build"
  DESTDIR="$pkgdir" make install
}
