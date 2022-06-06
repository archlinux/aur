# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mboost
_pkgver=2.9-7
pkgname=r-${_pkgname,,}
pkgver=2.9.7
pkgrel=1
pkgdesc='Model-Based Boosting'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-nnls
  r-partykit
  r-quadprog
  r-stabs
)
optdepends=(
  r-bayesx
  r-fields
  r-gbm
  r-kangar00
  r-mass
  r-mlbench
  r-nnet
  r-randomforest
  r-rcolorbrewer
  r-rpart
  r-testthat
  r-th.data
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0242cb91656280c4bd705643b65674900a1475305d9f80cfc12ef4b5fa069606')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
