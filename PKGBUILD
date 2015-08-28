# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
pkgname=texlive-ufsc-thesis
pkgver=20140729
pkgrel=1
pkgdesc='LaTeX class for Federal University of Santa Catarina (UFSC) theses'
arch=('any')
url="http://portal.bu.ufsc.br/normas-e-procedimentos/normalizacao/"
license=('GPL')
depends=('abntex')
install=$pkgname.install
source=("http://sbu.paginas.ufsc.br/files/2011/03/modelo.zip")
sha512sums=('d47cf0e0ebfeb066284838b578a646e7ae22e836c74b7f56562a4787e7f97a1b31f0412c411df4c766eb2a6179c1ba39a7f7dc55f7023d94e938d91a87bd305b')

package() {
  cd "${srcdir}/modelo/"
  
  # class and package
  install -Dm644 ufscThesis.cls \
    "${pkgdir}/usr/share/texmf-dist/tex/latex/ufscThesis/ufscThesis.cls"
  install -Dm644 ufscThesis/BUUFSCthesis.sty \
    "${pkgdir}/usr/share/texmf-dist/tex/latex/ufscThesis/ufscThesis/BUUFSCthesis.sty"

  # bibtex style
  install -Dm644 ufscThesis/ufsc-alf.bst \
    "${pkgdir}/usr/share/texmf-dist/bibtex/bst/ufsc-alf/ufsc-alf.bst"

  # example document
  install -Dm644 exemplo.tex \
    "${pkgdir}/usr/share/texmf-dist/tex/latex/ufscThesis/example/exemplo.tex"
  install -Dm644 bibliografia.bib \
    "${pkgdir}/usr/share/texmf-dist/tex/latex/ufscThesis/example/bibliografia.bib"
  install -Dm644 figuras/brasaoBU.jpg \
    "${pkgdir}/usr/share/texmf-dist/tex/latex/ufscThesis/example/figuras/brasaoBU.jpg"
  install -Dm644 exemplo_linux_fedora.pdf \
    "${pkgdir}/usr/share/texmf-dist/tex/latex/ufscThesis/example/exmeplo.pdf"
}
