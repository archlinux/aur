# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3
_pkgver=0.17.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Machine Learning in R - Next Generation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(LGPL3)
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
md5sums=('290053bf3dcaaed5b3e7c9c7848e50e2')
b2sums=('ecbe26807cfd140c5bf13c53dbd68c0bf4ec455fbbf3311be8987b81145fdf5524c64c2b7bc61d8ee41c2ccebc361028f1dd2f790f39641b6b107779cf7bf99c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
