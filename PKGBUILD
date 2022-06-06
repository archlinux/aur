# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MuMIn
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=1.46.0
pkgrel=3
pkgdesc='Multi-Model Inference'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-aod
  r-aods3
  r-betareg
  r-caper
  r-coxme
  r-cplm
  r-gamlss
  r-gamm4
  r-gee
  r-geem
  r-geepack
  r-glmmml
  r-lme4
  r-logistf
  r-mass
  r-mcmcglmm
  r-mgcv
  r-nnet
  r-ordinal
  r-pscl
  r-spatialreg
  r-spdep
  r-splm
  r-survival
  r-unmarked
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('33d2c93101e0f8e9c76049312c8996f5bbb86e5b440c7dc9cd0201be896d2009')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
