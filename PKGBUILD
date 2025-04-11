# Maintainer: Timo S. Prinz <t.prinz@coliza.de>
pkgname=librevna-gui-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="GUI application for the LibreVNA, a 100kHz to 6GHz 2 port USB based VNA"
arch=('x86_64' 'i686')
url="https://github.com/jankae/LibreVNA"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-svg')
optdepends=('librecal-udev: udev rules for LibreCAL control')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/jankae/LibreVNA/releases/download/v1.6.2/LibreVNA-GUI-Ubuntu-v1.6.2.zip"
"https://raw.githubusercontent.com/jankae/LibreVNA/master/Software/PC_Application/51-vna.rules")
sha256sums=('29601397606fdbb35a82ea520fe4403ed17ff3e46f8cb5152e0a32252daa5eac'
            'a37bf60fa15f700152df2969a8af598de82f9ffc51aa6173bd31adac246c70be')

# prepare() {
# 	cd "$srcdir/${pkgname}-${pkgver}"
# }

# build() {

# }

package() {
  install -Dm 755 LibreVNA-GUI ${pkgdir}/usr/bin/LibreVNA-GUI
  install -Dm 644 51-vna.rules ${pkgdir}/etc/udev/rules.d/51-LibreVNA.rules
}
