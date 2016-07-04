# Maintainer: Brendan Van Hook <brendan at vastactive dot com>

pkgname=tarsnap-gui
pkgver=0.9
pkgrel=1
pkgdesc="Cross-platform GUI for the Tarsnap backup service."
arch=(i686 x86_64)
url="https://github.com/Tarsnap/tarsnap-gui"
license=('BSD')
depends=('qt5-base' 'tarsnap')
source=("https://github.com/Tarsnap/${pkgname}/archive/v${pkgver}.zip")
sha256sums=('75c2649538f3965d55b744683e88bda5e9064e3de53c4387cd0dccf05530047c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt5
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 tarsnap-gui "${pkgdir}/usr/bin/tarsnap-gui"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
