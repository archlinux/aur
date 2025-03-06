# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AICcmodavg
_pkgver=2.3-4
pkgname=r-${_pkgname,,}
pkgver=2.3.4
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
sha256sums=('6898ab8503ea9d9d0b3273d8138d1e46610d4279db1659dfcb521878b95b571f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
