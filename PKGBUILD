# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=mekhq-development-snapshot-bin
_pkgname=mekhq
pkgver=0.50.03
_pkgver=
pkgrel=1
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

sha256sums=('2be9da23d03d956af11ec7cf567dfae4d04642e8cad5ba3dee99de04362bf23e'
	        '21caede87c03437ea8ff12bb67cf83b3af188d06fb951e4712e73ed6f31e892e'
	        'a6c0cc72c6f3ad773bdcec24c8036ae7d09dcaea4908f5b6d4e5ac6091cff772'
	        'caf5bf3e7294029c7b6dec974eed0253d6caf3804a6a9fcc953edc3c9be98b16'
	        '6e6bb03f14a0ce6e06fd9009fd9f159d22a34a7020ba85b13ad6dbf649ca9e38'
	        '8c0b940a2017f4063bdb06e06355632e3c49bf9c464ea9f4a1e188a3b8cd587c')

package() {

    install -D "MekHQ-${pkgver}${_pkgver}/MegaMek.jar" \
            "${pkgdir}/usr/lib/${_pkgname}/MegaMek.jar"

    install -D "MekHQ-${pkgver}${_pkgver}/MegaMekLab.jar" \
            "${pkgdir}/usr/lib/${_pkgname}/MegaMekLab.jar"

    install -D "MekHQ-${pkgver}${_pkgver}/MekHQ.jar" \
            "${pkgdir}/usr/lib/${_pkgname}/MekHQ.jar"

    install -Dm755 "MekHQ-${pkgver}${_pkgver}/bin/MegaMek" \
            "${pkgdir}/usr/lib/${_pkgname}/bin/MegaMek"
    install -Dm755 "MekHQ-${pkgver}${_pkgver}/bin/MekHQ" \
            "${pkgdir}/usr/lib/${_pkgname}/bin/MekHQ"
    install -Dm755 "MekHQ-${pkgver}${_pkgver}/bin/MegaMekLab" \
            "${pkgdir}/usr/lib/${_pkgname}/bin/MegaMekLab"

    cp -r "MekHQ-${pkgver}${_pkgver}/campaigns" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "MekHQ-${pkgver}${_pkgver}/data" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "MekHQ-${pkgver}${_pkgver}/docs" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "MekHQ-${pkgver}${_pkgver}/lib" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "MekHQ-${pkgver}${_pkgver}/logs" "${pkgdir}/usr/lib/${_pkgname}"

    cp -r "MekHQ-${pkgver}${_pkgver}/mmconf" "${pkgdir}/usr/lib/${_pkgname}"

    
    install -D mekhq.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -D megamek.desktop "${pkgdir}/usr/share/applications/megamek.desktop"
    install -D megameklab.desktop "${pkgdir}/usr/share/applications/megameklab.desktop"
    
    install -Dm755 mekhq.sh "${pkgdir}/usr/bin/${_pkgname}"
    ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/megamek"
    ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/megameklab"

}
