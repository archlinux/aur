# Maintainer: Fabien Michel <fabiin12@gmail.com>
_pkgname=laec-est-toi
pkgname=${_pkgname}-bin
pkgver=0.6.4
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
sha256sums=('42398222c66a2433e3ab1a3c917f84e21286938a113e06bc0b2b9f39b27e1a24'
            '8380b0839fb90c404179d4786ebd9bc0e14a87fa6748cab9edb9f82e68acabac'
            '6d20b86f9a78a2f6d382cf25bcb6849a2d89d27e4a94707128a98b33bed045a4')

package() {
    install -Dm755 -T "${srcdir}/${_pkgname}_${pkgver//./-}_linux64/laec-est-toi.x64" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${srcdir}/laec-est-toi.png" "${pkgdir}/usr/share/pixmaps/laec-est-toi.png"
    install -Dm755 "${srcdir}/laec-est-toi.desktop" "${pkgdir}/usr/share/applications/laec-est-toi.desktop"
}
