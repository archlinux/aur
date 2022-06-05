# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=catdata
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=1.2.2
pkgrel=4
pkgdesc='Categorical Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-class
  r-e1071
  r-ecdat
  r-flexmix
  r-gamboost
  r-gee
  r-geepack
  r-glmmml
  r-glmnet
  r-lme4
  r-lpsolve
  r-mboost
  r-mgcv
  r-mlogit
  r-nnet
  r-ordinal
  r-party
  r-penalized
  r-pscl
  r-qvcalc
  r-rms
  r-rpart
  r-vcdextra
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7297062e6b1bd3a3046b8762fee8832b5c66ec434b2bc913f4cd6c06a23f7d92')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
