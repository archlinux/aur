# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-angelfish
pkgver=1.5.1
pkgrel=1
arch=('x86_64')
pkgdesc="Plasma Demo Webbrowser for Mobile Devices"
url="https://invent.kde.org/plasma-mobile/plasma-angelfish"
license=('GPL2')
depends=('qt5-webengine' 'purpose' 'kirigami2')
makedepends=('extra-cmake-modules')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('99a9d2fecad07ce4c8ebc39847ec6d006f1ca212c597738f42e9f84c5a06d960eeb17089edcd2671ea8ab133c41d3834155118c5d975a9bc6de7e6f9d18a72f5')

prepare() {
  cd ${srcdir}/${pkgname}-v${pkgver}
  mkdir -p build
}

build() {
  cd ${srcdir}/${pkgname}-v${pkgver}/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
    cd ${srcdir}/${pkgname}-v${pkgver}/build
    make DESTDIR="${pkgdir}" install
}

#vim: syntax=sh
