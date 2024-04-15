# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterExperiment
_pkgver=2.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Compare Clusterings for Single-Cell Sequencing"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
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
md5sums=('0a4bac02f2b310d941afe62b329e7eee')
b2sums=('4233a8d3b54a40ac80eb77480f2f07003e6624182a308925cbc27127b1f875679d8045e05008f5dba5fcc01ab5e729673cf3fa9ada9330ab43361fcc04932aec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
