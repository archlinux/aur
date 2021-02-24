# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=plasma-angelfish
pkgver=1.8.0
pkgrel=1
arch=('x86_64')
pkgdesc="Web browser for Plasma Mobile"
url="https://invent.kde.org/plasma-mobile/angelfish"
license=('GPL2')
depends=('qt5-webengine' 'purpose' 'kirigami2')
makedepends=('extra-cmake-modules' 'corrosion-git')
source=("https://download.kde.org/stable/angelfish/${pkgver}/angelfish-${pkgver}.tar.xz")
sha256sums=('def9a40de962c634304eadb91d505aa21faa70d327270e9de85b34c471ca8cd8')

build() {
  cd ${srcdir}/angelfish-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
  make -C build
}

package() {
  cd ${srcdir}/angelfish-${pkgver}
  make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

#vim: syntax=sh
