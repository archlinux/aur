# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EWCE
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
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
  r-badger
  r-biocstyle
  r-cowplot
  r-delayedmatrixstats
  r-deseq2
  r-ggdendro
  r-grdevices
  r-grid
  r-gridextra
  r-knitr
  r-magick
  r-markdown
  r-mast
  r-memoise
  r-readxl
  r-remotes
  r-rmarkdown
  r-scales
  r-sctransform
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8482badcd971559b1fcf2d933845c7921176b033e2fc93ba40a9811194412627')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
