# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterExperiment
_pkgver=2.28.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('0f980c8ce4f86438204e28309531c152')
b2sums=('90617ef525f2add72c34a50c711061c78d284ee11bd874df9c2d86f5ac2cf325b005e31fd69da066b74b087bbe11b49b7caef517a3be7e34104656ca563a6e67')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
