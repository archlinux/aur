# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3
_pkgver=0.20.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Machine Learning in R - Next Generation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-backports
  r-checkmate
  r-data.table
  r-evaluate
  r-future
  r-future.apply
  r-lgr
  r-mlbench
  r-mlr3measures
  r-mlr3misc
  r-palmerpenguins
  r-paradox
  r-parallelly
  r-r6
  r-uuid
)
optdepends=(
  r-callr
  r-future.callr
  r-mlr3data
  r-progressr
  r-remotes
  r-rhpcblasctl
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6c1db49a490ac6d7b372cea45b3cf0f5')
b2sums=('9e059bd40befa5652aebaae36a25839665671f0430606264dd0227739722fc8ed68f793ed809a3531d5880959e7750a502ea00664f22b2cb7cbb2f0e565fbb3a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
