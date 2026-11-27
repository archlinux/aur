# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=celldex
_pkgver=1.23.0
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
md5sums=('0d66e36da68884a223dc3553bf5763f9')
b2sums=('1317a45ff728ea23e19a0d3ac972b7d9d296bb947963b596be73751acfa2757d54259e13a42f3fdd9ab9ccff08a257cb9277376f140db99aeac62d5e7b7370e5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
