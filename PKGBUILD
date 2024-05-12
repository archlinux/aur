# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SQLDataFrame
_pkgver=1.18.0
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
md5sums=('d3f3b42d554d7262bb6dedc1d362d9b3')
b2sums=('3953beef5982876d7d55f6f28dbff4e27cce3c6fc8c2ea8fbc73d2bd236d15b5755da43bc72fa02e43c2ef5f2fd409106c34ae4d75f4f54bd1c461a3d298fa3f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
