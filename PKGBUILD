# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=mekhq-development-snapshot-bin
_pkgname=mekhq
pkgver=0.49.8
_pkgver=
pkgrel=3
epoch=
install=mekhq.install
pkgdesc="Development snapshot release of the MekHQ/MegaMek suite."

arch=('x86_64')
url="https://github.com/MegaMek/mekhq"
license=('GPL')
groups=()
depends=('jdk-openjdk' 'rsync')
provides=('mekhq' 'megamek')
conflicts=('mekhq' 'megamek')

source=("https://github.com/MegaMek/mekhq/releases/download/v${pkgver}/${_pkgname}-${pkgver}${_pkgver}.tar.gz"
        "mekhq.install"
        "mekhq.desktop"
        "megamek.desktop"
        "megameklab.desktop"
        "mekhq.sh")

sha256sums=('31ebe969e807bccf54a42af1776de0b7bbad52cacc8f356ae6571bba5cc0cc00'
            'f2ea2a3a903087091d29c0ef21080c7ef72fb58fe37a58ffc32f4845d52618ca'
            'a6c0cc72c6f3ad773bdcec24c8036ae7d09dcaea4908f5b6d4e5ac6091cff772'
            'caf5bf3e7294029c7b6dec974eed0253d6caf3804a6a9fcc953edc3c9be98b16'
            '6e6bb03f14a0ce6e06fd9009fd9f159d22a34a7020ba85b13ad6dbf649ca9e38'
            '7479a602ec847e26f247e4a5512b96ff9ef979fde46c5d170c33326af8c59377')

package() {

    install -D "${_pkgname}-${pkgver}${_pkgver}/MegaMek.jar" \
            "${pkgdir}/usr/lib/${_pkgname}/MegaMek.jar"

    install -D "${_pkgname}-${pkgver}${_pkgver}/MegaMekLab.jar" \
            "${pkgdir}/usr/lib/${_pkgname}/MegaMekLab.jar"

    install -D "${_pkgname}-${pkgver}${_pkgver}/MekHQ.jar" \
            "${pkgdir}/usr/lib/${_pkgname}/MekHQ.jar"

    install -Dm755 "${_pkgname}-${pkgver}${_pkgver}/mm-startup" \
            "${pkgdir}/usr/lib/${_pkgname}/mm-startup"
    install -Dm755 "${_pkgname}-${pkgver}${_pkgver}/mhq-startup" \
            "${pkgdir}/usr/lib/${_pkgname}/mhq-startup"
    install -Dm755 "${_pkgname}-${pkgver}${_pkgver}/mml-startup" \
            "${pkgdir}/usr/lib/${_pkgname}/mml-startup"

    cp -r "${_pkgname}-${pkgver}${_pkgver}/campaigns" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "${_pkgname}-${pkgver}${_pkgver}/data" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "${_pkgname}-${pkgver}${_pkgver}/docs" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "${_pkgname}-${pkgver}${_pkgver}/lib" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "${_pkgname}-${pkgver}${_pkgver}/logs" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "${_pkgname}-${pkgver}${_pkgver}/mmconf" "${pkgdir}/usr/lib/${_pkgname}"

    
    install -D mekhq.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -D megamek.desktop "${pkgdir}/usr/share/applications/megamek.desktop"
    install -D megameklab.desktop "${pkgdir}/usr/share/applications/megameklab.desktop"
    
    install -Dm755 mekhq.sh "${pkgdir}/usr/bin/${_pkgname}"
    ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/megamek"
    ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/megameklab"

}
