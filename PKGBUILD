# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3
_pkgver=0.19.0
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
  r-rhpcblasctl
  r-uuid
)
optdepends=(
  r-callr
  r-future.callr
  r-mlr3data
  r-progressr
  r-remotes
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7c1f047bc252ef8e08259586542927bc')
b2sums=('474b80c0149e3e4da9d2228915efe156439e0ce0714fb3c29b60c0e981d3058bdbc5b67de6705ab3b44f2f849a3b10e79a7e0b9fc6171e9ecbe7e063297a7fa4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
