# Maintainer: William Tang <galaxyking0419@gmail.com>
# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-lookdevx
pkgver=1.9.0
pkgrel=1
pkgdesc='Artist-friendly look-development system with graph shading objects and USD materials'
arch=('x86_64')
url='https://help.autodesk.com/view/MAYAUL/2026/ENU/?guid=LookdevX_LookdevX_for_Maya_html'
license=('custom')
depends=('maya>=2026.2' 'maya<2027' 'maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please unbundle the rpm from the Maya download')
source=("manual://LookdevX-${pkgver}-${_mayaver}.el8.x86_64.rpm")
b2sums=('ff15dbc89fb79c8959db7b920e24e096bcdc0d91c208fa8d4a520bf03faea09566dd4e13abbcaa3a4f752f8e343c9d728f15cb0972f8d3ec1acb9013fb477246')

options=(!strip)

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya$_mayaver/"{modules,lookdevx}
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/modules/*.mod "$pkgdir/usr/autodesk/maya$_mayaver/modules/"
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/lookdevx/* "$pkgdir/usr/autodesk/maya$_mayaver/lookdevx/"
}
