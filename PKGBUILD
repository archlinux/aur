# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=celldex
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Index of Reference Cell Type Datasets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-alabaster.base
  r-alabaster.matrix
  r-alabaster.se
  r-annotationdbi
  r-annotationhub
  r-dbi
  r-delayedarray
  r-delayedmatrixstats
  r-experimenthub
  r-gypsum
  r-jsonlite
  r-rsqlite
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-dt
  r-ensembldb
  r-jsonvalidate
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('184b9a4161cbccf6cbd33ab6d38d2c74')
b2sums=('46d80d3bb1695a0eb4babf4eb86218e65e32e09f3cd377b68696ede31675313edd685c9edac648b612ace266cda89cf8fbbf1af2455aa61edce3213799404001')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
