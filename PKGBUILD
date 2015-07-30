# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>

pkgname=latex-tuddesign-thesis
pkgver=0.0.20140703
pkgrel=1
pkgdesc="Corporate-design for LaTeX from Technische Universität Darmstadt"
arch=('any')
url="http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/"
license=('GPL-3')
depends=('texlive-core' 'latex-tuddesign' 'latex-tuddesign-fonts')
install=$pkgname.install
source=(http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/latex/latex-tuddesign-thesis/$pkgname\_$pkgver.zip)
md5sums=('ecd9d6b70d6af04e337820dc3b081ca9')

package() {
    cd texmf
    install -dm755 "${pkgdir}/usr/share/texmf/"
    
    for subdir in doc tex; do
        cp -r $subdir "${pkgdir}/usr/share/texmf/"
    done

    cd "${pkgdir}/usr/share/texmf"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
}
