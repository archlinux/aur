# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SQLDataFrame
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Representation of SQL tables in DataFrame metaphor"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-or-later')
depends=(
  r-biocgenerics
  r-dbi
  r-delayedarray
  r-duckdb
  r-rsqlite
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2448466a5203b92539fe0e1b7522379b')
b2sums=('e9b691a9704ffe939c754b3b19f1fcf930b03d3f3503d966a56550b86800339cd34e4de3396b37109ebcb8797aecb4179f353b47924e73b293b2b42a15d53384')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
