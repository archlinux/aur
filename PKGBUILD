pkgname=quartus-standard-device-stratixv
pkgver=17.1.0.590
pkgrel=1
pkgdesc="Stratix V device support for Quartus Prime Standard Edition"
arch=('x86_64')
url="http://dl.altera.com/?edition=lite#tabs-2"
license=('custom')
#http://download.altera.com/akdlm/software/acdsinst/17.1std/590/ib_installers/cyclonev-17.1.0.590.qdz
_alteradir="/opt/altera"

depends=('quartus-standard')

source=("http://download.altera.com/akdlm/software/acdsinst/17.1std/590/ib_installers/cyclonev-${pkgver}" )
md5sums=('SKIP')
options=('!strip' '!upx') # No need for device support
PKGEXT=".pkg.tar" # Do not compress

package() {
    cd "${srcdir}"

    # Use mv instead of install/cp to save I/O in case of big device support packages
    install -d -m755 "${pkgdir}/${_alteradir}/"
    mv ${srcdir}/quartus "${pkgdir}/${_alteradir}/"

    # Fix permissions
    cd "${pkgdir}/${_alteradir}"
    chmod -R u+w ./
}