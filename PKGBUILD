# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=effectsize
_pkgver=0.8.6
pkgname=r-${_pkgname,,}
pkgver=0.8.6
pkgrel=1
pkgdesc='Indices of Effect Size and Standardized Parameters'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayestestr
  r-datawizard
  r-insight
  r-parameters
  r-performance
)
optdepends=(
  r-afex
  r-bayesfactor
  r-boot
  r-brms
  r-car
  r-correlation
  r-emmeans
  r-gt
  r-knitr
  r-lavaan
  r-lme4
  r-lmertest
  r-mass
  r-mgcv
  r-parsnip
  r-rmarkdown
  r-rms
  r-rstanarm
  r-rstantools
  r-see
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d1ee2d6d912bae45e6110b8ab0bcc986bd69687fcd287c36dc628e708433b33d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
