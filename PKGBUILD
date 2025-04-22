# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clusterExperiment
_pkgver=2.28.0
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
md5sums=('7f410a34a437211196f23763f6fd04a2')
b2sums=('2dc3451baabbd2cf1554380e68385618673866e8b1297f37872c4bc13de5391969bb241539497553089cf4efd97a5c397e5acaa25c543c306c42d342d76a5d85')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
