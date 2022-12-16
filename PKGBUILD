# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scmap
_pkgver=1.20.1
pkgname=r-${_pkgname,,}
pkgver=1.20.1
pkgrel=1
pkgdesc='A tool for unsupervised projection of single cell RNA-seq data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-biocgenerics
  r-dplyr
  r-e1071
  r-ggplot2
  r-googlevis
  r-matrixstats
  r-proxy
  r-randomforest
  r-rcpp
  r-rcpparmadillo
  r-reshape2
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('47fbe547864aacb345674e74dbfb34b2053444b2421745f8dbe4a0697d410167')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
