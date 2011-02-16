# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# $Id$
# vim:set ts=2 sw=2 et:

pkgname=latex-template-springer
pkgver=201102
pkgrel=2
pkgdesc="Springer templates for LNCS proceedings and other multiauthor volumes (llncs), monographs (svmono) and journals (svjour3)"
arch=('any')
url="http://www.springer.com/computer/lncs?SGWID=0-164-7-72376-0"
license=('')
groups=()
depends=('texlive-latex3')
makedepends=('unzip')
optdepends=()
provides=(latex-template-lncs)
conflicts=(latex-template-lncs)
replaces=(latex-template-lncs)
backup=()
options=()
install=texlive.install
source=(ftp://ftp.springer.de/pub/tex/latex/llncs/latex2e/llncs2e.zip
http://www.springer.com/cda/content/document/cda_downloaddocument/svmono.zip
ftp://ftp.springer.de/pub/tex/latex/svjour3/global.zip)

build() {
  for _SVJOUR3 in readme.txt svjour3.cls usrguid3.pdf svglov3.clo template.tex; do
    install -m 0644 -D ${srcdir}/${_SVJOUR3} ${pkgdir}/usr/share/texmf-dist/tex/latex/svjour3/${_SVJOUR3}
  done

  for _SVMONO in instruct.pdf quickstart.pdf refguide.pdf styles/* templates/*; do
    install -m 0644 -D ${srcdir}/${_SVMONO} ${pkgdir}/usr/share/texmf-dist/tex/latex/svmono/${_SVMONO#*/}
  done

  for _LLNCS in read.me llncs.cls llncs.dem llncs.doc llncsdoc.pdf llncsdoc.sty llncs.ind subjidx.ind sprmindx.sty; do
    install -m 0644 -D ${srcdir}/${_LLNCS} ${pkgdir}/usr/share/texmf-dist/tex/latex/llncs/${_LLNCS}
  done

  install -m 0644 -D ${srcdir}/spphys.bst ${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer/spphys.bst
  install -m 0644 -D ${srcdir}/splncs03.bst ${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer/splncs03.bst
  mv ${pkgdir}/usr/share/texmf-dist/tex/latex/svmono/*.bst \
    ${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer/
}
md5sums=('d534148be975055ec332f4cdcd1087d5'
         '7e74a3efdde7e08c9aa463a786a93209'
         'c020d70fa6ce887d9a3b70d72c518c85')
