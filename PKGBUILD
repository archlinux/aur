# Maintainer: William Tang <galaxyking0419@gmail.com>
# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2027

pkgname=maya-lookdevx
pkgver=2.0.0
pkgrel=1
pkgdesc='Artist-friendly look-development system with graph shading objects and USD materials'
arch=('x86_64')
url='https://help.autodesk.com/view/MAYAUL/2026/ENU/?guid=LookdevX_LookdevX_for_Maya_html'
license=('custom')
depends=("maya>=${_mayaver}" 'maya<2028' 'maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please unbundle the rpm from the Maya download')
source=("manual://LookdevX-${pkgver}-${_mayaver}.el8.x86_64.rpm")
b2sums=('f599d7194e8a23031221d2e224951f23a56e08ea4e7539c92dd720e1aab0d63eb3c0efc4655a695a0a54a2ba311183dc23cdb088f0888e4f5aa9a81dcaa2872f')

options=(!strip)

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya$_mayaver/"{modules,lookdevx}
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/modules/*.mod "$pkgdir/usr/autodesk/maya$_mayaver/modules/"
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/lookdevx/* "$pkgdir/usr/autodesk/maya$_mayaver/lookdevx/"
}
