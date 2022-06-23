# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=muscat
_pkgver=1.10.1
pkgname=r-${_pkgname,,}
pkgver=1.10.1
pkgrel=1
pkgdesc='Multi-sample multi-group scRNA-seq data analysis tools'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocparallel
  r-blme
  r-complexheatmap
  r-data.table
  r-deseq2
  r-dplyr
  r-edger
  r-ggplot2
  r-glmmtmb
  r-limma
  r-lme4
  r-lmertest
  r-matrixstats
  r-progress
  r-purrr
  r-s4vectors
  r-scales
  r-scater
  r-sctransform
  r-scuttle
  r-singlecellexperiment
  r-summarizedexperiment
  r-variancepartition
  r-viridis
)
optdepends=(
  r-biocstyle
  r-countsimqc
  r-cowplot
  r-experimenthub
  r-icobra
  r-knitr
  r-phylogram
  r-rcolorbrewer
  r-reshape2
  r-rmarkdown
  r-statmod
  r-testthat
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cd3ddcd139a08b5bae9912b0848dcab8692e6550d187357ddb22a9ff309c7fc8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
