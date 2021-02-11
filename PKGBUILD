# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-angelfish
pkgver=1.7.1
pkgrel=1
arch=('x86_64')
pkgdesc="Web browser for Plasma Mobile"
url="https://invent.kde.org/plasma-mobile/plasma-angelfish"
license=('GPL2')
depends=('qt5-webengine' 'purpose' 'kirigami2')
makedepends=('extra-cmake-modules')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('ec9f5a2437104f6dd220b0d008806b27def85b4b5882486f99182a9dc5bf23ba28c73b52aa1e35939ad43957a2de22da353591bdde87f6ac4c5684946e2f1752')

build() {
  cd ${srcdir}/${pkgname}-v${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd ${srcdir}/${pkgname}-v${pkgver}
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

#vim: syntax=sh
