# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=mekhq
pkgver=0.46.1
_pkgver=
pkgrel=2
epoch=
pkgdesc="MekHQ is a java helper program for the MegaMek game that allows users to load a list of entities from an XML file, perform repairs and customizations, and then save the new entities to another XML file that can be loaded into MegaMek."

arch=('x86_64')
url="https://github.com/MegaMek/mekhq"
license=('GPL')
groups=()
depends=('jdk-openjdk')
provides=('megamek')
conflicts=('megamek')

source=("https://github.com/MegaMek/mekhq/releases/download/v${pkgver}/${pkgname}-${pkgver}${_pkgver}.tar.gz"
        "mekhq.desktop"
        "megamek.desktop"
        "mekhq.sh"
        "megamek.sh")

sha256sums=('32ca1dbd59457f84028a0355597bea42224034c07500dfd8e9d7e4e46ea7fb87'
            'a6c0cc72c6f3ad773bdcec24c8036ae7d09dcaea4908f5b6d4e5ac6091cff772'
            'caf5bf3e7294029c7b6dec974eed0253d6caf3804a6a9fcc953edc3c9be98b16'
            'fda6e9d542062041e9d9b7f6331069d8a78b9455a290286aa8d214ed66b13fd7'
            '9ad4d0251ecfe02140c46dfeb67a4ce2b0fe9f123b04a3911139b8e255ff2beb')

package() {

    install -D "${pkgname}-${pkgver}${_pkgver}/MegaMek.jar" \
            "${pkgdir}/usr/lib/${pkgname}/MegaMek.jar"

    install -D "${pkgname}-${pkgver}${_pkgver}/MegaMekLab.jar" \
            "${pkgdir}/usr/lib/${pkgname}/MegaMekLab.jar"

    install -D "${pkgname}-${pkgver}${_pkgver}/MekHQ.jar" \
            "${pkgdir}/usr/lib/${pkgname}/MekHQ.jar"

    install -Dm755 "${pkgname}-${pkgver}${_pkgver}/mm-startup" \
            "${pkgdir}/usr/lib/${pkgname}/mm-startup"
    install -Dm755 "${pkgname}-${pkgver}${_pkgver}/hq" \
            "${pkgdir}/usr/lib/${pkgname}/hq"
    install -Dm755 "${pkgname}-${pkgver}${_pkgver}/lab" \
            "${pkgdir}/usr/lib/${pkgname}/lab"

    cp -r "${pkgname}-${pkgver}${_pkgver}/campaigns" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}${_pkgver}/data" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}${_pkgver}/docs" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}${_pkgver}/lib" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}${_pkgver}/logs" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}${_pkgver}/mmconf" "${pkgdir}/usr/lib/${pkgname}"

    
    install -D mekhq.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D megamek.desktop "${pkgdir}/usr/share/applications/megamek.desktop"
    
    install -Dm755 mekhq.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 megamek.sh "${pkgdir}/usr/bin/megamek"

}
