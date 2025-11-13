# Maintainer: William Tang <galaxyking0419@gmail.com>
# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-lookdevx
pkgver=1.10.0
pkgrel=1
pkgdesc='Artist-friendly look-development system with graph shading objects and USD materials'
arch=('x86_64')
url='https://help.autodesk.com/view/MAYAUL/2026/ENU/?guid=LookdevX_LookdevX_for_Maya_html'
license=('custom')
depends=('maya>=2026' 'maya<2027' 'maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please unbundle the rpm from the Maya download')
source=("manual://LookdevX-${pkgver}-${_mayaver}.el8.x86_64.rpm")
b2sums=('ea3bb852c2f05d0d1b96674aac25a52378caa123a672bae6f18f24478927d336c5140bf576e2586359b09b81e30067bcd1cef4971fbcbb215af163d48dc72d68')

options=(!strip)

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya$_mayaver/"{modules,lookdevx}
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/modules/*.mod "$pkgdir/usr/autodesk/maya$_mayaver/modules/"
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/lookdevx/* "$pkgdir/usr/autodesk/maya$_mayaver/lookdevx/"
}
