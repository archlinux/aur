# Maintainer: Timo S. Prinz <t.prinz@coliza.de>
pkgname=librecal-gui-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="GUI application for the LibreCAL, a 4-port eCal module"
arch=('x86_64' 'i686')
url="https://github.com/jankae/LibreCAL"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-charts' 'qt6-svg')
provides=("${pkgname%-gui-bin}" "${pkgname%-gui-bin}-udev")
conflicts=("${pkgname%-gui-bin}" "${pkgname%-gui-bin}-udev")
source=("https://github.com/jankae/LibreCAL/releases/download/v${pkgver}/LibreCAL-GUI-Ubuntu-v${pkgver}.zip"
"https://raw.githubusercontent.com/jankae/LibreCAL/main/Software/52-LibreCAL.rules")
sha256sums=('1bf48ea8a0bbbda32390289cef66259ccbdf2f95884af6d8484774c4cc090885'
            'deecc862a8dd255f98cddb793f54f11d4f216d804d674d5f5590849f84afab5a')

# prepare() {
# 	cd "$srcdir/${pkgname}-${pkgver}"
# }

# build() {

# }

package() {
  install -Dm 755 LibreCAL-GUI ${pkgdir}/usr/bin/LibreCAL-GUI
  install -Dm 644 52-LibreCAL.rules ${pkgdir}/etc/udev/rules.d/52-LibreCAL.rules
}
