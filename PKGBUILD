# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# $Id$

pkgname=latex-template-springer
pkgver=200904
pkgrel=1
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
source=(ftp://ftp.springer.de/pub/tex/latex/llncs/llncs2e.zip
http://www.springer.com/cda/content/document/cda_downloaddocument/svmono.zip
ftp://ftp.springer.de/pub/tex/latex/svjour3/global.zip
ftp://ftp.springer.de/pub/tex/latex/svjour3/bibtex/spbasic.bst
ftp://ftp.springer.de/pub/tex/latex/svjour3/bibtex/spmpsci.bst
ftp://ftp.springer.de/pub/tex/latex/svjour3/bibtex/spphys.bst)
md5sums=('d8d23fccf1e8d546e3da41a13aeb6d2c'
         '150c62216a841d3bb7a98c96fed71827'
         '246d532d4b641a60bc9900432c836b92'
         'b27924137faccbc3d13ebae5a7538c63'
         'f2e974a27cc4fa86625973055f231000'
         '1a2e9515055a3f496c0942d26adea55d')

build() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/{llncs,svjour3}
  mkdir -p ${pkgdir}/usr/share/texmf-dist/bst/svjour3
  unzip ${srcdir}/llncs2e.zip -d ${pkgdir}/usr/share/texmf-dist/tex/latex/llncs
  cp -R ${srcdir}/pub/tex/latex/mathegl/mono/ \
    ${pkgdir}/usr/share/texmf-dist/tex/latex
  unzip ${srcdir}/llncs2e.zip -d \
    ${pkgdir}/usr/share/texmf-dist/tex/latex/svjour3
  cp ${srcdir}/{spbasic,spmpsci,spphys}.bst ${pkgdir}/usr/share/texmf-dist/bst/svjour3
}

# vim:set ts=2 sw=2 et:
