# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterExperiment
_pkgver=2.20.0
pkgname=r-${_pkgname,,}
pkgver=2.20.0
pkgrel=1
pkgdesc='Compare Clusterings for Single-Cell Sequencing'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-ape
  r-biocgenerics
  r-biocsingular
  r-delayedarray
  r-edger
  r-hdf5array
  r-howmany
  r-kernlab
  r-limma
  r-locfdr
  r-matrixstats
  r-mbkmeans
  r-nmf
  r-phylobase
  r-pracma
  r-rcolorbrewer
  r-rcpp
  r-s4vectors
  r-scales
  r-singlecellexperiment
  r-stringr
  r-summarizedexperiment
  r-zinbwave
)
optdepends=(
  r-biocstyle
  r-igraph
  r-knitr
  r-mast
  r-rmarkdown
  r-rtsne
  r-scran
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('069cbd43265e51d4e1e553206e75a6589d8450afd9e6b40cd45cb42b0dfc4240')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
