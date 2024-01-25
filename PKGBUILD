# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=catdata
_pkgver=1.2.4
pkgname=r-${_pkgname,,}
pkgver=1.2.4
pkgrel=1
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
sha256sums=('1c586c2cc9dd1ec3d12d8d2fdbed1055bb36268449e82949efbac9eca45d71bf')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
