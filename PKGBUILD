# Maintainer: Jordan Day < jordanday444 at gmail dot com >
# Contributer: Brendan Van Hook <brendan at vastactive dot com>

pkgname=tarsnap-gui
pkgver=1.0.2
pkgrel=2
pkgdesc="Cross-platform GUI for the Tarsnap backup service."
arch=(i686 x86_64)
url="https://github.com/Tarsnap/tarsnap-gui"
license=('BSD')
depends=('qt5-base' 'tarsnap')
source=("https://github.com/Tarsnap/${pkgname}/archive/v${pkgver}.zip")
sha256sums=('7a8185bc569fd34ff375fbc2c9a560dad192465dc1cf1a331677f1bcf8339a3b')

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
