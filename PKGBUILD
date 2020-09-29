# Maintainer: Markus Härer <markus.haerer@gmx.net>

pkgname=latex-questionnaire  
pkgver=20100202
pkgrel=3
pkgdesc="Styles for creating questionnaires with LaTeX"
url="http://www.qdds.org"
arch=('any')
license=('custom')
depends=('texlive-core')
source=('http://132.252.189.3/fileadmin/files/latexstyles.zip'
        'latex-questionnaire.install')
md5sums=('7ec3014675e1318c26cd1a7d625400b1'
         'a573ca786bc416e905171f49abf3ba46')
install=latex-questionnaire.install

package() {
  cd "${srcdir}"

  # Create dirs
  mkdir -p "${pkgdir}/usr/share/texmf/tex/latex/PaperAndPencil"
  mkdir -p "${pkgdir}/usr/share/texmf/tex/latex/PAPI"

  mkdir -p "${pkgdir}/usr/share/texmf/tex/latex/PaperAndPencil/paperandpencil_examples"

  mkdir -p "${pkgdir}/usr/share/doc/PaperAndPencil"
  mkdir -p "${pkgdir}/usr/share/doc/PAPI"

  # Install styles
  install -Dm644 "PaperAndPencil/paperandpencil.sty" "${pkgdir}/usr/share/texmf/tex/latex/PaperAndPencil/"
  install -Dm644 "PAPI/papi.sty" "${pkgdir}/usr/share/texmf/tex/latex/PAPI/"

  # Install examples
  install -Dm644 PaperAndPencil/paperandpencil_examples/* "${pkgdir}/usr/share/texmf/tex/latex/PaperAndPencil/paperandpencil_examples/"
  install -Dm644 PAPI/papi_beispiel* "${pkgdir}/usr/share/texmf/tex/latex/PAPI/"

  # Install docs
  install -Dm644 PaperAndPencil/*.pdf "${pkgdir}/usr/share/doc/PaperAndPencil/"
  install -Dm644 PAPI/*papi.pdf "${pkgdir}/usr/share/doc/PAPI/"
   
}
