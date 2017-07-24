# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>

pkgname=latex-tuddesign-thesis
pkgver=0.0.20140703
pkgrel=2
pkgdesc='Corporate-design for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://www.intern.tu-darmstadt.de/arbeitsmittel/corporate_design_vorlagen/index.de.jsp'
license=('custom')
depends=('texlive-core' 'latex-tuddesign' 'latex-tuddesign-fonts')
source=(local://${pkgname//dd/d}\_${pkgver//./}.zip)
sha512sums=('d7685ace3e512ac048e23ccb768b9bd6b26e0bc1c0bee5a1cfea6e4510c5b47180b5f93c5655ddfefa1d60fb32a3fd3d5be04ca13612b3866a7993796ae3eb9b')

package() {
    cd texmf
    install -dm755 "${pkgdir}/usr/share/texmf/"

    for subdir in doc tex; do
        cp -r ${subdir} "${pkgdir}/usr/share/texmf/"
    done

    cd "${pkgdir}/usr/share/texmf"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
}
