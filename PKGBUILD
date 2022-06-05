# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AICcmodavg
_pkgver=2.3-1
pkgname=r-${_pkgname,,}
pkgver=2.3.1
pkgrel=4
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
sha256sums=('d0517da15a38e9b1df20fa73f5342b586624e65792d266e7dff278ad7fc458b0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
