# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tm
_pkgver=0.7-12
pkgname=r-${_pkgname,,}
pkgver=0.7.12
pkgrel=1
pkgdesc='Text Mining Package'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-nlp
  r-rcpp
  r-slam
  r-xml2
)
optdepends=(
  r-antiword
  r-filehash
  r-methods
  r-pdftools
  r-rcampdf
  r-rgraphviz
  r-rpoppler
  r-snowballc
  r-testthat
  r-tm.lexicon.generalinquirer
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7ec823a3b2bb844f2154fc75d432f75b73fe85f2b7b1033e23e3fd27cdbf1ffc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
