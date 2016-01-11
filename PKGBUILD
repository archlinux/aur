# Maintainer: Manish Munikar <munikarmanish at gmail dot com>

pkgname=argouml
pkgver=0.34
pkgrel=2
pkgdesc="UML 1.4 modeller"
arch=('any')
url="http://argouml.tigris.org/"
license=('EPL')
depends=('java-runtime')
source=("${pkgname}-${pkgver}.tar.gz::http://argouml-downloads.tigris.org/nonav/argouml-0.34/ArgoUML-0.34.tar.gz"
        "${pkgname}"
        "${pkgname}.desktop");
noextract=()
md5sums=("440efea6096a00b8c19daab1ecddaf7c"
         "c9febf6fcf3230e1a1538ef9502d2d2c"
         "1fb534f8d951e4de781216bcf44fa03c")
validpgpkeys=()

package() {
    # Creating directories
    mkdir -p ${pkgdir}/opt/${pkgname}
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/applications/

    msg2 "Copying source files..."
    cp -pR ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}/

    msg2 "Creating executable file..."
    cp -p ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

    msg2 "Creating desktop entry..."
    cp -p ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
