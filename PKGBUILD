# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
pkgname=texlive-ufsc-thesis
pkgver=20151005
pkgrel=1
pkgdesc='LaTeX class for Federal University of Santa Catarina (UFSC) theses'
arch=('any')
url="http://portal.bu.ufsc.br/normas-e-procedimentos/normalizacao/"
license=('GPL')
depends=('abntex')
install=$pkgname.install
source=("http://portal.bu.ufsc.br/files/2013/10/template-tex-2015.zip")
sha512sums=('61d768fe9de94df61c62c527f8e602572c4d1e9035e476d92c84d093f37cfbf46bceb3a1a9ae1b33e2b377089f9c514e37a5b8ddd29d0306dc0e468004d8a860')

package() {
  cd "${srcdir}/modelo/"
  
  # class and package
  install -Dm644 ufscThesis.cls \
    "${pkgdir}/usr/share/texmf-dist/tex/latex/ufscThesis/ufscThesis.cls"
  install -Dm644 Ficha_Catalografica.pdf \
    "${pkgdir}/usr/share/texmf-dist/tex/latex/ufscThesis/Ficha_Catalografica.pdf"
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
  install -Dm644 exemplo_linux.pdf \
    "${pkgdir}/usr/share/texmf-dist/tex/latex/ufscThesis/example/exemplo_linux.pdf"
}
