# Maintainer: Synflow <synflow@elektronische-nachricht.de>
pkgname=oscr-ui-bin
pkgver=11.1.1
pkgrel=1
pkgdesc="OSCR-UI - Open Source Combat Reader (GUI)"
arch=('x86_64')
url="https://github.com/STOCD/OSCR-UI"
license=('GPL-3.0')
depends=('python')
source=("https://github.com/STOCD/OSCR-UI/releases/download/v${pkgver}/oscr-ui-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('45a29cad0e01b0eb960fd8f72d7393129630e4abb398b37be64df0685233c6cc')

package() {
  install -Dm 644 -v "${srcdir}/usr/share/applications/oscr-ui.desktop" "${pkgdir}/usr/share/applications/oscr-ui.desktop"
  
  install -Dm 644 -v "${srcdir}/usr/share/icons/hicolor/256x256/apps/oscr-ui.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/oscr-ui.png"

  install -d "${pkgdir}/opt/oscr-ui"
  cp -a "${srcdir}/opt/oscr-ui/_internal" "${pkgdir}/opt/oscr-ui/"

  install -Dm 755 -v "${srcdir}/opt/oscr-ui/OSCR-UI" "${pkgdir}/opt/oscr-ui/OSCR-UI"
}
