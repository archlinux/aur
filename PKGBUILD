# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=chimerax
pkgver=1.2.5
pkgrel=1
pkgdesc="UCSF ChimeraX (or simply ChimeraX) is the next-generation molecular visualization program from the Resource for Biocomputing, Visualization, and Informatics (RBVI), following UCSF Chimera."
arch=(x86_64)
url="https://www.cgl.ucsf.edu/chimerax/"
license=(custom)
depends=(libffi6)
options=(!strip)
source=(local://ChimeraX-${pkgver}.tar.gz
        LICENSE)
sha256sums=('5678f2d627b7acc28427cb9fb7b73b9d8289e862791b1b5335999e3dc4e69af7'
            'SKIP')

package() {
    install -d "${pkgdir}/opt/chimerax" "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -R "${pkgname}-${pkgver}-rc-2021.05.24"/{bin,include,lib,share} "${pkgdir}/opt/chimerax/"
    ln -s "/opt/chimerax/bin/ChimeraX" "${pkgdir}/usr/bin"
}
