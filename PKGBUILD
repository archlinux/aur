# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# Contributor: florianbw <florian.bw@gmail.com>
# $Id$
# vim:set ts=2 sw=2 et:

pkgname=latex-template-springer
pkgver=201110
pkgrel=1
pkgdesc="Springer templates for LNCS proceedings (llncs), monographs (svmono), multiauthor volumes (svmult) and journals (svjour3)"
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
http://www.springer.com/cda/content/document/cda_downloaddocument/svmult.zip
http://www.springer.com/cda/content/document/cda_downloaddocument/svmono.zip
ftp://ftp.springer.de/pub/tex/latex/svjour3/global.zip)

build() {
  for _SVJOUR3 in readme.txt svjour3.cls usrguid3.pdf svglov3.clo template.tex; do
    install -m 0644 -D ${srcdir}/${_SVJOUR3} ${pkgdir}/usr/share/texmf-dist/tex/latex/svjour3/${_SVJOUR3}
  done

  for _SVMONO in instruct.pdf quickstart.pdf refguide.pdf styles/* templates/*; do
    [[ ${_SVMONO} == *"/*" ]] && install -m 755 -d ${pkgdir}/usr/share/texmf-dist/tex/latex/svmono/${_SVMONO#/*}
    install -m 0644 -D ${srcdir}/${_SVMONO} ${pkgdir}/usr/share/texmf-dist/tex/latex/svmono/${_SVMONO%\*}
  done

  for _SVMULT in instruct.pdf quickstart.pdf refguide.pdf styles/* templates/*; do
    [[ ${_SVMULT} == *"/*" ]] && install -m 755 -d ${pkgdir}/usr/share/texmf-dist/tex/latex/svmult/${_SVMULT#/*}
    install -m 0644 -D ${srcdir}/${_SVMULT} ${pkgdir}/usr/share/texmf-dist/tex/latex/svmult/${_SVMULT%\*}
  done


  for _LLNCS in readme.txt llncs.cls llncs.dem llncs.doc llncsdoc.pdf llncsdoc.sty llncs.ind subjidx.ind sprmindx.sty; do
    install -m 0644 -D ${srcdir}/${_LLNCS} ${pkgdir}/usr/share/texmf-dist/tex/latex/llncs/${_LLNCS}
  done

  install -m 0644 -D ${srcdir}/spphys.bst ${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer/spphys.bst
  install -m 0644 -D ${srcdir}/splncs03.bst ${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer/splncs03.bst
  # XXX: BSTs have disappeared from the latest version of svmono... Go figure...
  #mv ${pkgdir}/usr/share/texmf-dist/tex/latex/svmono/*.bst \
  # ${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer/
}

md5sums=('d534148be975055ec332f4cdcd1087d5'
         '9d5bf25a905806ed4297138062afaf71'
         '7e74a3efdde7e08c9aa463a786a93209'
         'c020d70fa6ce887d9a3b70d72c518c85')
md5sums=('d534148be975055ec332f4cdcd1087d5'
         '9d5bf25a905806ed4297138062afaf71'
         '150c62216a841d3bb7a98c96fed71827'
         'c020d70fa6ce887d9a3b70d72c518c85')
