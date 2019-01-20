# Contributor: Kevin Guan <KevinGuan.gm@gmail.com>

pkgname=iptux
pkgver=0.7.6
pkgrel=1
pkgdesc="software for sharing in LAN"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/iptux-src/iptux/"
depends=(gtk3 gstreamer gst-plugins-good)
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/iptux-src/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('c4da730c50d3c5a69d437b72bdc25e4fba0b3b931f250e62cf50456fe8748caf')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
