# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scater
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
  r-densvis
  r-ggbeeswarm
  r-ggplot2
  r-ggrastr
  r-ggrepel
  r-pheatmap
  r-rcolorbrewer
  r-rcppml
  r-rlang
  r-rtsne
  r-s4vectors
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-uwot
  r-viridis
)
optdepends=(
  r-biobase
  r-biocstyle
  r-biomart
  r-cowplot
  r-knitr
  r-rmarkdown
  r-robustbase
  r-scattermore
  r-scrnaseq
  r-snifter
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('93e17a1586d9316cf07db1e3079583cb8c3723b57599ddbb27a0acb3a953d86c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
