# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
pkgname=texlive-sbc-article
pkgver=20111103
pkgrel=1
pkgdesc='LaTeX style package for Brazilian Computer Society conference papers'
arch=('any')
url="http://www.sbc.org.br/"
license=('LPPL')
depends=('texlive-core')
makedepends=('unrar')
install=$pkgname.install
_filename='sbc-article.rar'
source=("$_filename::http://www.sbc.org.br/index.php?option=com_jdownloads&Itemid=195&task=finish&cid=38&catid=32")
sha512sums=('ca5304e417dc81642b64fcaed96af68dec74839759d29d2138baa2ca4d600592294c09641bdf25c3288c0e1eb0db8109d8ca0f2498ef5efc63c582b1ba76330f')
noextract=("$_filename")

prepare() {
  unrar x -o+ $_filename
}

package() {
  cd "${srcdir}/Template_SBC/template-latex/"
  
  # style package
  install -Dm644 sbc-template.sty \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-article/sbc-template.sty"
  
  # bibtex style
  install -Dm644 sbc.bst \
  	"${pkgdir}/usr/share/texmf-dist/bibtex/bst/sbc/sbc.bst"

  # example document
  install -Dm644 sbc-template.tex \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-article/example/sbc-template.tex"
  install -Dm644 fig1.jpg \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-article/example/fig1.jpg"
  install -Dm644 fig2.jpg \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-article/example/fig2.jpg"
  install -Dm644 table.jpg \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-article/example/table.jpg"
  install -Dm644 sbc-template.dvi \
  	"${pkgdir}/usr/share/texmf-dist/tex/latex/sbc-article/example/sbc-template.dvi"
}
