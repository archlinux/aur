# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=celldex
_pkgver=1.16.0
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
md5sums=('ba3dc1f475b673ee0303293d6d997194')
b2sums=('cc5f7f01359f01245dfec977579256fa3d79910298ee89b9ffab91f57bb397448d6c1ce5601a08dd8152c7d4c7acbcd0fd0c53bd627d0a534f25e371855b7e6c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
