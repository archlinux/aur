# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MuMIn
_pkgver=1.47.5
pkgname=r-${_pkgname,,}
pkgver=1.47.5
pkgrel=1
pkgdesc='Multi-Model Inference'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-insight
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
  r-splm
  r-survival
  r-unmarked
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6ff3554d8a503f29b1bd9e94dc2d4e1a9bcde5cd9faa5f8473b0559aced20a77')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
