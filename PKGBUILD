# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstatsTMTPTM
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=1.1.2
pkgrel=3
pkgdesc='Post Translational Modification (PTM) Significance Analysis in shotgun mass spectrometry-based proteomic experiments with tandem mass tag (TMT) labeling'
arch=('x86_64')
url="https://bioconductor.org/packages/3.13/bioc/html/MSstatsTMTPTM.html"
license=('Artistic2.0')
depends=(
  r
  r-dplyr
  r-ggplot2
  r-gridextra
  r-msstatstmt
  r-rcpp
  r-reshape2
  r-stringr
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-msstats
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.13/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9b0008d448c2a99ff8981cf09e4bc55fd441cb68a3180679465b830c3435de90')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
