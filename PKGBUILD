# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>

pkgname=latex-tuddesign
pkgver=1.0.20140928
pkgrel=1
pkgdesc="Corporate-design for LaTeX from Technische Universität Darmstadt"
arch=('any')
url="http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/"
license=('GPL-3')
depends=('texlive-core' 'latex-tuddesign-fonts')
install=$pkgname.install
source=(http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/latex/latex-tuddesign/$pkgname\_$pkgver.zip)
md5sums=('bef53c5903a40a62d4539cfccc38e658')

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
