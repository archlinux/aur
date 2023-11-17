# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AICcmodavg
_pkgver=2.3-3
pkgname=r-${_pkgname,,}
pkgver=2.3.3
pkgrel=1
pkgdesc='Model Selection and Multimodel Inference Based on (Q)AIC(c)'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-unmarked
  r-vgam
  r-xtable
)
optdepends=(
  r-betareg
  r-coxme
  r-fitdistrplus
  r-glmmtmb
  r-jagsui
  r-lavaan
  r-lme4
  r-lmertest
  r-maxlike
  r-nnet
  r-ordinal
  r-pscl
  r-r2jags
  r-r2openbugs
  r-r2winbugs
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4055b5f1fc12917b9f812c056e6a2dbf23bbd0169e468f567306ddf29d699f7a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
