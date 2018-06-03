# Contributor: Kevin Guan <KevinGuan.gm@gmail.com>

pkgname=iptux
pkgver=0.7.5
pkgrel=1
pkgdesc="software for sharing in LAN"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/iptux-src/iptux/"
depends=(gtk3 gstreamer gst-plugins-good)
makedepends=(cmake)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/iptux-src/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('37fd2618e888d44b3ddcc21e2d497f0a8dcbdb2adcb23fd137fb8e56d2d46919')

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
