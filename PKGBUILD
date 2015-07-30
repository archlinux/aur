# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>

pkgname=latex-tuddesign-fonts
pkgver=0.0.20090806
pkgrel=3
pkgdesc="Fonts of the corporate-design for LaTeX from Technische Universität Darmstadt (Only available within the TUD-network!)"
arch=('any')
url="http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/"
license=('GPL')
depends=('texlive-core' 'texlive-fontsextra')
install=$pkgname.install
source=(http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/latex/tudfonts-tex/tudfonts-tex\_$pkgver.zip)
md5sums=('b226fd0b2af0f9ebba9013ac9b3fb839')

package() {
    cd texmf
    install -dm755 "${pkgdir}/usr/share/texmf/"
    
    for subdir in doc tex fonts; do
        cp -r $subdir "${pkgdir}/usr/share/texmf/"
    done

    cd "${pkgdir}/usr/share/texmf"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
}
