# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3
_pkgver=0.13.4
pkgname=r-${_pkgname,,}
pkgver=0.13.4
pkgrel=1
pkgdesc='Machine Learning in R - Next Generation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
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
  r-codetools
  r-datasets
  r-distr6
  r-future.callr
  r-matrix
  r-mlr3data
  r-progressr
  r-remotes
  r-rpart
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('932f7b63842c56924639e3be49cb533c17f586c12d43539d0faa019f659ee08d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
