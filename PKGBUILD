# Maintainer: William Tang <galaxyking0419@gmail.com>

_mayaver=2022

pkgname=maya-rokoko-motion-library
pkgver=2.0.0
pkgrel=1
pkgdesc='Autodesk Maya Rokoko Motion Library Plugin'
arch=('x86_64')
url='https://www.rokoko.com/motion-library'
license=('custom')
depends=('maya>=2022' 'maya<2023.0')

source=("https://cdn.rokoko.com/motion-library/autodesk-maya/2022/2.0.0/RokokoMotionLibraryMaya2022-2.0.0-1.x86_64.rpm")
sha256sums=('ef2322c0584f21d0df8016a1126b0419682dbc91eab856fe243a2d752ae0a253')

options=(!strip)

prepare() {
    echo "+ Rokoko $pkgver /usr/autodesk/maya$_mayaver/plug-ins/rokoko-motion-library" > usr/autodesk/modules/maya/$_mayaver/rokoko.mod
}

package() {
    mkdir -p $pkgdir/usr/autodesk/maya$_mayaver/{modules,plug-ins/rokoko-motion-library}
    mv usr/autodesk/modules/maya/$_mayaver/rokoko.mod $pkgdir/usr/autodesk/maya$_mayaver/modules/
    mv opt/rokoko_motion_library/maya/$_mayaver/* $pkgdir/usr/autodesk/maya$_mayaver/plug-ins/rokoko-motion-library/
}
