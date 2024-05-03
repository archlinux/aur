# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BayesSpace
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='Clustering and Resolution Enhancement of Spatial Transcriptomes'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-assertthat
  r-biocfilecache
  r-biocsingular
  r-coda
  r-dirichletreg
  r-ggplot2
  r-mclust
  r-purrr
  r-rcpp
  r-rcpparmadillo
  r-rcppdist
  r-rcppprogress
  r-rcurl
  r-rhdf5
  r-s4vectors
  r-scales
  r-scater
  r-scran
  r-singlecellexperiment
  r-summarizedexperiment
  r-xgboost
  gcc
)
optdepends=(
  r-dplyr
  r-igraph
  r-knitr
  r-patchwork
  r-rcolorbrewer
  r-rmarkdown
  r-seurat
  r-spatiallibd
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a57bcbdb93c5598b8a9b0889e888b6576a66f4d8faa460c3ef3e18e635563060')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
