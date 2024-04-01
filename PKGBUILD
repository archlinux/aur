# Maintainer: Hu Butui <hot123tea123@gmail.com>

_pkgname=effectsize
_pkgver=0.8.7
pkgname=r-${_pkgname,,}
pkgver=0.8.7
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
  r-mgcv
  r-parsnip
  r-pwr
  r-rmarkdown
  r-rms
  r-rstanarm
  r-rstantools
  r-see
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('624d47a3eb7167fbf693699419840fd1ffc0717b46c3d4bd975641bc2f508e1e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
