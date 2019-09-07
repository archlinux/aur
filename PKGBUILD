# Maintainer: Manish Munikar <munikarmanish at gmail dot com>

pkgname=argouml
pkgver=0.35.1
pkgrel=1
pkgdesc="UML 1.4 modeller"
arch=('any')
url="http://argouml.tigris.org/"
license=('EPL')
depends=('java-runtime')
source=("${pkgname}-${pkgver}.tar.gz::http://argouml-downloads.tigris.org/nonav/argouml-0.35.1/ArgoUML-0.35.1.tar.gz"
        "${pkgname}.desktop");
noextract=()
sha256sums=('5e5230eb1bd29c545ae6fd56c0bdfbee86b1e6c2c538d6df22728fa3e3ab1639'
            'b3d19c56d8c81bb75d4a9b3b994acd2db5ccad144db7d6b0c0cd5487b54a9157')
validpgpkeys=()

package() {
    # Creating directories
    mkdir -p ${pkgdir}/opt/${pkgname}
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/applications/

    msg2 "Copying source files..."
    cp -pR ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname}/

    msg2 "Creating executable file..."
    ln -s "/opt/argouml/argouml.sh" ${pkgdir}/usr/bin/${pkgname}

    msg2 "Creating desktop entry..."
    cp -p ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
