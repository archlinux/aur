# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>

pkgname=latex-tuddesign
pkgver=1.0.20140928
pkgrel=2
pkgdesc='Corporate-design for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/'
license=('custom')
depends=('texlive-core' 'latex-tuddesign-fonts')
source=(http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/latex/latex-tuddesign/${pkgname}\_${pkgver}.zip)
sha512sums=('0b5ef53bc782b9fe9f98735fdf9d60b68bc777ff14273cd89517786e55706122d7e29d3e70c501021dfc23edc6f00a8119e61291d4fdb83018bc6a3db916e5ca')

package() {
    cd texmf
    install -dm755 "${pkgdir}/usr/share/texmf/"

    for subdir in doc tex; do
        cp -r "${subdir}" "${pkgdir}/usr/share/texmf/"
    done

    cd "${pkgdir}/usr/share/texmf"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
}
