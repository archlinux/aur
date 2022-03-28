# Maintainer: Fabien Michel <fabiin12@gmail.com>
_pkgname=laec-est-toi
pkgname=${_pkgname}-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Game presenting the measures of the Union Populaire program, L'Avenir En Commun, for the French presidential election of 2022"
arch=('x86_64')
url="https://laec-est-toi.fr"
license=('custom:cc0' 'unknown')
provides=(${_pkgname})

source=("${_pkgname}_${pkgver}_linux64.tar.gz::https://www.laec-est-toi.fr/downloads/latest/laec-est-toi_linux64.tar.gz" 
        "laec-est-toi.png" 
        "laec-est-toi.desktop")
options=("!strip")
sha256sums=('4e33ceeb7f291e228eaa2c3b57ea79e3597c297c4954b946e89a39fbf64d5452'
            'SKIP'
            'SKIP')

package() {
    install -Dm755 -T "${srcdir}/${_pkgname}_${pkgver//./-}_linux64/laec-est-toi.x64" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${srcdir}/laec-est-toi.png" "${pkgdir}/usr/share/pixmaps/laec-est-toi.png"
    install -Dm755 "${srcdir}/laec-est-toi.desktop" "${pkgdir}/usr/share/applications/laec-est-toi.desktop"
}
