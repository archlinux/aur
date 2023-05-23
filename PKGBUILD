# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EWCE
_pkgver=1.8.2
pkgname=r-${_pkgname,,}
pkgver=1.8.2
pkgrel=1
pkgdesc='Expression Weighted Celltype Enrichment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocparallel
  r-data.table
  r-delayedarray
  r-dplyr
  r-ewcedata
  r-ggplot2
  r-hgnchelper
  r-limma
  r-orthogene
  r-reshape2
  r-rnomni
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-delayedmatrixstats
  r-deseq2
  r-ggdendro
  r-knitr
  r-markdown
  r-mast
  r-memoise
  r-patchwork
  r-readxl
  r-remotes
  r-rmarkdown
  r-rworkflows
  r-scales
  r-sctransform
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c6dcacdef7b452a92e33ac67d943a2ed06e26ed7d33ad61d213e673ff8c22736')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
