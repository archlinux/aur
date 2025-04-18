# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SQLDataFrame
_pkgver=1.22.0
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
md5sums=('96784d155140694212faf3d183676646')
b2sums=('4acb03d6df5ee00dc3e452185f43dba4bab8074d8ecd20da0ad7b4da15e59c146479dcea46ef3b0c776e98684a6a42a8b773671a059a354c1c0ca10f19287990')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
