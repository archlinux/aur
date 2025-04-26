# Maintainer: William Tang <galaxyking0419@gmail.com>
# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-lookdevx
pkgver=1.7.0
pkgrel=1
pkgdesc='Artist-friendly look-development system with graph shading objects and USD materials'
arch=('x86_64')
url='https://help.autodesk.com/view/MAYAUL/2026/ENU/?guid=LookdevX_LookdevX_for_Maya_html'
license=('custom')
depends=('maya>=2026' 'maya<2027' 'maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please unbundle the rpm from the Maya download')
source=("manual://LookdevX-${pkgver}-${_mayaver}.el8.x86_64.rpm")
b2sums=('36e29338256bbe9c91471218e0130d058dc518dff7371657269951f776d8056facbee4c1a710e92cece4a39266c8647141175247810ca283db790f701d99b0a6')

options=(!strip)

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya$_mayaver/"{modules,plug-ins}
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/modules/*.mod "$pkgdir/usr/autodesk/maya$_mayaver/modules/"
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/plug-ins/* "$pkgdir/usr/autodesk/maya$_mayaver/plug-ins/"
}
