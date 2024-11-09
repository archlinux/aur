# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mbkmeans
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=1.22.0
pkgrel=1
pkgdesc='Mini-batch K-means Clustering for Single-Cell RNA-seq'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-beachmat
  r-benchmarkme
  r-biocparallel
  r-clusterr
  r-delayedarray
  r-rcpp
  r-rcpparmadillo
  r-rhdf5lib
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  gcc
)
optdepends=(
  r-beachmat
  r-biocstyle
  r-bluster
  r-delayedmatrixstats
  r-hdf5array
  r-knitr
  r-rhdf5lib
  r-rmarkdown
  r-scater
  r-tenxpbmcdata
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e3b27429ab4899352f8a6214526e645a9387a66fada0993d0fa45c20a919952a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
