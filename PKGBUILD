# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netSmooth
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=1.16.0
pkgrel=1
pkgdesc='Network smoothing for scRNAseq'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-clusterexperiment
  r-data.table
  r-delayedarray
  r-entropy
  r-hdf5array
  r-scater
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-biomart
  r-ggplot2
  r-igraph
  r-knitr
  r-nmi
  r-pheatmap
  r-rmarkdown
  r-rtsne
  r-stringdb
  r-testthat
  r-uwot
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('98305b52d8d6a7bbd5c18b286735ad240257714320b1c1d62c3108bc356af14b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
