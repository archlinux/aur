# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>

pkgname=latex-tuddesign
pkgver=2016.03.01
pkgrel=1
pkgdesc='Corporate-design for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://www.intern.tu-darmstadt.de/arbeitsmittel/corporate_design_vorlagen/index.de.jsp'
license=('custom')
depends=('texlive-core' 'latex-tuddesign-fonts')
source=(local://${pkgname//dd/d}_${pkgver//\./-}.zip)
sha512sums=('4c7d6e189ab0f309b61f40883abaa009fbc81a8e3d532348453e29288025c1ff8327bec3677d521437b0d82550ccc2aceb9b72b9c2bd627d262a95ea6f2f1f2b')

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
