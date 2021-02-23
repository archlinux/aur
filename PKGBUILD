# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-angelfish
pkgver=1.7.1
pkgrel=2
arch=('x86_64')
pkgdesc="Web browser for Plasma Mobile"
url="https://invent.kde.org/plasma-mobile/angelfish"
license=('GPL2')
depends=('qt5-webengine' 'purpose' 'kirigami2')
makedepends=('extra-cmake-modules' 'corrosion-git')
source=("${url}/-/archive/v${pkgver}/angelfish-v${pkgver}.tar.gz")
sha512sums=('e0695d7cfc5b1f723538e4aa85a85e4ea999d62ae356c0fbd5f4f5d812bef77bc406eafd93e44cceb37efeff15b43722a9ba84685fee102466ff5ad26e9e1391')

build() {
  cd ${srcdir}/angelfish-v${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd ${srcdir}/angelfish-v${pkgver}
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

#vim: syntax=sh
