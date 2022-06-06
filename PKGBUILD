# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scater
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='Single-Cell Analysis Toolkit for Gene Expression Data in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-beachmat
  r-biocgenerics
  r-biocneighbors
  r-biocparallel
  r-biocsingular
  r-delayedarray
  r-delayedmatrixstats
  r-ggbeeswarm
  r-ggplot2
  r-ggrepel
  r-gridextra
  r-rcolorbrewer
  r-rlang
  r-rtsne
  r-s4vectors
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-viridis
  r-rcppml
)
optdepends=(
  r-biobase
  r-biocstyle
  r-biomart
  r-cowplot
  r-destiny
  r-knitr
  r-nmf
  r-pheatmap
  r-rmarkdown
  r-robustbase
  r-scrnaseq
  r-snifter
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3c9718fd782a69159d4361f497fea417478682f200274b09b6c5d7c3dfcb1137')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
