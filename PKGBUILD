# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=kdsoap
pkgver=1.6.0
pkgrel=2
pkgdesc='Qt-based client-side and server-side SOAP component'
license=('GPL3' 'LGPL' 'custom')
arch=('x86_64' 'i686')
url='https://github.com/KDAB/KDSoap'
depends=('qt5-base')
conflicts=('kdsoap-qt4')
makedepends=('cmake')
source=("https://github.com/KDAB/KDSoap/releases/download/kdsoap-${pkgver}/kdsoap-${pkgver}.tar.gz")
sha256sums=('d6b6b01348d2e1453f7e12724d1848ee41c86a1b19168ca67ac98fedb0408668')

build() {
  cd "$pkgname-$pkgver"
  mkdir build && pushd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib ..
  make 
  popd
}

package() {
  cd "$pkgname-$pkgver"/build
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
