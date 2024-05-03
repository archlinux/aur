# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scMerge
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='scMerge: Merging multiple batches of scRNA-seq data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-batchelor
  r-biocneighbors
  r-biocparallel
  r-biocsingular
  r-cvtools
  r-delayedarray
  r-delayedmatrixstats
  r-distr
  r-igraph
  r-m3drop
  r-proxyc
  r-ruv
  r-s4vectors
  r-scater
  r-scran
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-badger
  r-biocstyle
  r-covr
  r-hdf5array
  r-knitr
  r-matrix
  r-proxy
  r-rmarkdown
  r-scales
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('84ffc40a23965dd3d7bfe79ff8e4605a88a4b44947a430d6e880c3938522646c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
