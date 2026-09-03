# Maintainer: piratecarrot

pkgname=elmerfem-gui-bin
pkgver=26.2.1
_pkgrel_src=1
pkgrel=1
pkgdesc="Graphical user interface for the Elmer software suit (precompiled)"
arch=('x86_64')
url="https://www.elmerfem.org"
license=('GPL-2.0-only AND LicenseRef-ElmerGUI-exception')
options=('!debug')
provides=('elmerfem-gui')
conflicts=('elmerfem-gui' 'elmerfem-git' 'elemerfem')
depends=(
    'boost-libs'
    'freetype2'
    'glu'
    'opencascade'
    'paraview'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qwt'
    'vtk'
)
optdepends=('elmerfem-base-bin: FEM solver')

source=("https://github.com/tubbywrestler/elmerfem-gui-bin/releases/download/${pkgver}-${_pkgrel_src}/elmerfem-gui-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst")
sha256sums=('0f818aefe394a44706712fd61870b57e8c8218dbdb1c11bc3942d825e49e3eb9')

package() {
    bsdtar -xf "${srcdir}/elmerfem-gui-${pkgver}-${_pkgrel_src}-x86_64.pkg.tar.zst" -C "${pkgdir}" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
