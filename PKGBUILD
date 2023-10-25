# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=progeny
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Pathway RespOnsive GENes for activity inference from gene expression'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Apache')
depends=(
  r
  r-biobase
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-tidyr
  r-decoupler
  r-reshape2
)
optdepends=(
  r-airway
  r-biocfilecache
  r-biocstyle
  r-biomart
  r-broom
  r-deseq2
  r-knitr
  r-pheatmap
  r-readr
  r-readxl
  r-rmarkdown
  r-seurat
  r-singlecellexperiment
  r-testthat
  r-tibble
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('14b3f8e2ff46459f5c5bccc962edd38e2068b1fbff62878881ebf4ea44e48fde')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
