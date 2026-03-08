# Maintainer: pisevren <aur@local>
# Contributor: Timo S. Prinz <t.prinz@coliza.de>

pkgname=librevna-gui-bin
pkgver=1.6.5
pkgrel=1
pkgdesc="GUI application for the LibreVNA, a 100kHz to 6GHz 2 port USB based VNA"
arch=('x86_64')
url="https://github.com/jankae/LibreVNA"
license=('GPL-3.0-only')

depends=('qt6-base' 'qt6-svg')
optdepends=('librecal-udev: udev rules for LibreCAL control')

provides=('librevna-gui')
conflicts=('librevna-gui')

source=(
  "https://github.com/jankae/LibreVNA/releases/download/v${pkgver}/LibreVNA-GUI-Ubuntu-v${pkgver}.zip"
  "https://raw.githubusercontent.com/jankae/LibreVNA/v${pkgver}/Software/PC_Application/51-vna.rules"
)
sha256sums=('667d57bfd514923f2e581aa8c4cf98ca06be5765d6bae9d499180642fbcb9054'
            'a37bf60fa15f700152df2969a8af598de82f9ffc51aa6173bd31adac246c70be')

package() {
  install -Dm755 "$srcdir/LibreVNA-GUI" "$pkgdir/usr/bin/LibreVNA-GUI"

  # Upstream name; easier troubleshooting/documentation consistency
  install -Dm644 "$srcdir/51-vna.rules" "$pkgdir/etc/udev/rules.d/51-vna.rules"
}

