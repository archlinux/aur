# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=celda
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='CEllular Latent Dirichlet Allocation'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-circlize
  r-complexheatmap
  r-data.table
  r-dbscan
  r-delayedarray
  r-digest
  r-doparallel
  r-enrichr
  r-foreach
  r-ggplot2
  r-ggrepel
  r-gtable
  r-matrixstats
  r-mcmcprecision
  r-multipanelfigure
  r-plyr
  r-rcolorbrewer
  r-rcpp
  r-rcppeigen
  r-reshape2
  r-rtsne
  r-s4vectors
  r-scales
  r-scater
  r-scran
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-uwot
  r-withr
  r-dendextend
  r-ggdendro
  r-proc
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-biomart
  r-covr
  r-knitr
  r-m3dexampledata
  r-rmarkdown
  r-roxygen2
  r-singlecelltk
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9490f2b91c4554b249256840597cc6d2be7ebfa5fbd26d20b79249f0524e6923')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
