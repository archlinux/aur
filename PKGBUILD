# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TCA
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Tensor Composition Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-config
  r-data.table
  r-futile.logger
  r-gmodels
  r-matrixcalc
  r-matrixstats
  r-nloptr
  r-pbapply
  r-pracma
  r-quadprog
  r-rsvd
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cfd6fc03ef50d2b7685ee902f44d8ef6')
b2sums=('0f88ec8bf4e730fa95e244f8116b16dbf68dbd45d66c294e2e96a1ceecd8de0550854064471a4bf2fe8fbaec3d2a3f17073bdd64793ae877070c775765e70268')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
