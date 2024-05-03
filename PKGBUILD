# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=muscat
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
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
sha256sums=('f105ef9ccbf35853b21e25215892923fb54e2b9a10ddf11f126e247307664ebd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
