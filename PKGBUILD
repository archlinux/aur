# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-angelfish
pkgver=1.6.0
pkgrel=1
arch=('x86_64')
pkgdesc="Plasma Demo Webbrowser for Mobile Devices"
url="https://invent.kde.org/plasma-mobile/plasma-angelfish"
license=('GPL2')
depends=('qt5-webengine' 'purpose' 'kirigami2')
makedepends=('extra-cmake-modules')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('597da22ae0ae612da5f838e411063f24c062398c16c3ca4fa9a3e75bbca63a3afa97de7a3e39a25e46b5f887ef68e6bb2cbf9275094cd7da597579a61d774cc3')

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
