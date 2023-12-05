# Maintainer: William Tang <galaxyking0419@gmail.com>
# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2024

pkgname=maya-lookdevx
pkgver=1.2.0
pkgrel=1
pkgdesc='Artist-friendly look-development system with graph shading objects and USD materials'
arch=('x86_64')
url='https://help.autodesk.com/view/MAYAUL/2024/ENU/?guid=LookDevX_LookdevX_html'
license=('custom')
depends=('maya>=2024' 'maya<2025.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please unbundle the rpm from the Maya download')
source=("manual://LookdevX.rpm")
b2sums=('eb7a1d8a3f9125408f93511e16bbdea93d0dac2fb12c30d9bd7a1a3aafa3d3bdd19dd51ffbac70c0cbad55894c8a24fd4b64f02dfb93dcc5d974ea5fc3a06639')

options=(!strip)

package() {
    mkdir -p $pkgdir/usr/autodesk/maya$_mayaver/{modules,plug-ins}
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/modules/*.mod $pkgdir/usr/autodesk/maya$_mayaver/modules/
    mv usr/autodesk/lookdevx/maya$_mayaver/$pkgver/plug-ins/* $pkgdir/usr/autodesk/maya$_mayaver/plug-ins/
}
