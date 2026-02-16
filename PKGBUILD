# Maintainer: pisevren <aur@local>
# Contributor: Timo S. Prinz <t.prinz@coliza.de>

pkgname=librecal-gui-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="GUI application for the LibreCAL, a 4-port eCal module"
arch=('x86_64')
url="https://github.com/jankae/LibreCAL"
license=('GPL-3.0-only')

depends=('qt6-base' 'qt6-charts' 'qt6-svg')

# This binary package provides the same GUI and udev rules as the source package(s).
provides=('librecal-gui' 'librecal-udev')
conflicts=('librecal-gui' 'librecal-udev')

source=(
  "https://github.com/jankae/LibreCAL/releases/download/v${pkgver}/LibreCAL-GUI-Ubuntu-v${pkgver}.zip"
  "https://raw.githubusercontent.com/jankae/LibreCAL/v${pkgver}/Software/52-LibreCAL.rules"
)
sha256sums=(
  '9d70df37ab23f516a4ebdc2b8b6705ce1966f0690a3d6594faad9bbfca705e88'
  'deecc862a8dd255f98cddb793f54f11d4f216d804d674d5f5590849f84afab5a'
)

package() {
  install -Dm755 "$srcdir/LibreCAL-GUI" "$pkgdir/usr/bin/LibreCAL-GUI"
  install -Dm644 "$srcdir/52-LibreCAL.rules" "$pkgdir/etc/udev/rules.d/52-LibreCAL.rules"
}

