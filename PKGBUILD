# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CelliD
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=1.6.1
pkgrel=1
pkgdesc='Unbiased Extraction of Single Cell gene signatures using Multiple Correspondence Analysis'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-data.table
  r-fastmatch
  r-fgsea
  r-ggplot2
  r-glue
  r-irlba
  r-matrixstats
  r-pbapply
  r-rcpp
  r-rcpparmadillo
  r-reticulate
  r-rtsne
  r-scater
  r-seurat
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-tictoc
  r-umap
)
optdepends=(
  r-biocstyle
  r-destiny
  r-ggpubr
  r-ggrepel
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b04dacf4bf4cf4e2dc3f62349fe2f3615baa1707691218efb8da42a4d727e010')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
