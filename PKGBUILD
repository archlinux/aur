# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3
_pkgver=1.8.0
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
  r-cli
  r-data.table
  r-evaluate
  r-future
  r-future.apply
  r-lgr
  r-mirai
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
md5sums=('5aefa2cb6bbbd8f7d749c2db2fa874b9')
b2sums=('3fb3fd431d71e42c0f6fe119ac0f1039797039c9f866bf7d89f21efc821401c9a3435469e9b68a5a7b47b4414b58515cbf7bad831ed5b4098f861779d4513f6e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
