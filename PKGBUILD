# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=chimerax
pkgver=1.4
pkgrel=1
pkgdesc="UCSF ChimeraX (or simply ChimeraX) is the next-generation molecular visualization program from the Resource for Biocomputing, Visualization, and Informatics (RBVI), following UCSF Chimera."
arch=(x86_64)
url="https://www.cgl.ucsf.edu/chimerax/"
license=(custom)
depends=(libffi6)
options=(!strip)
source=(local://ChimeraX-${pkgver}.tar.gz
        LICENSE)
sha256sums=('d34255343d86fb8e889230290ecf37ec2da42f12d5f486404c20c4de63517c87'
            '4361604379b11e73ad942144ef84aaf479815f80265f98fed9879f3c82e3aa8d')

package() {
    install -d "${pkgdir}/opt/chimerax" "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -R "${pkgname}-${pkgver}"/{bin,include,lib,share} "${pkgdir}/opt/chimerax/"
    ln -s "/opt/chimerax/bin/ChimeraX" "${pkgdir}/usr/bin"
}
