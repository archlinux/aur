# Maintainer: William Tang <galaxyking0419@gmail.com>
# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2027

pkgname=maya-lookdevx
pkgver=2.1.0
pkgrel=1
pkgdesc='Artist-friendly look-development system with graph shading objects and USD materials'
arch=('x86_64')
url='https://help.autodesk.com/view/MAYAUL/2026/ENU/?guid=LookdevX_LookdevX_for_Maya_html'
license=('custom')
depends=("maya>=${_mayaver}" 'maya<2028' 'maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please unbundle the rpm from the Maya download')
source=("manual://LookdevX-${pkgver}-${_mayaver}.el8.x86_64.rpm")
b2sums=('fcb4902b812a5b68f30315e30a8de1f470ec0f43dd000b1d525b1bfdd1764420a8c110ebf1d780987f6aaf93cbd2fc43f996566f8e4a5a869d2dc4f1f550a4e3')

options=(!strip)

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya$_mayaver/"{modules,lookdevx}
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/modules/*.mod "$pkgdir/usr/autodesk/maya$_mayaver/modules/"
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/lookdevx/* "$pkgdir/usr/autodesk/maya$_mayaver/lookdevx/"
}
