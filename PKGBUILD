# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=celda
_pkgver=1.16.1
pkgname=r-${_pkgname,,}
pkgver=1.16.1
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
sha256sums=('edb52809498282deb797b2e3de3718c1cc51d4ce9c1a4cb7cee5c2b46eebe15b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
