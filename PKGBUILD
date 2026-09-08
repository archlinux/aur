# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mboost
_pkgver=2.9-14
pkgname=r-${_pkgname,,}
pkgver=2.9.14
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
sha256sums=('c3e53d1ec4347edf74344cc942d63b5cc8351b98b6e415455e3d47dc96ed4d8f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
