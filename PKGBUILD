# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=broom.mixed
_pkgver=0.2.9.6
pkgname=r-${_pkgname,,}
pkgver=0.2.9.6
pkgrel=1
pkgdesc='Tidying Methods for Mixed Models'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-broom
  r-coda
  r-dplyr
  r-purrr
  r-stringr
  r-tibble
  r-tidyr
  r-forcats
  r-furrr
)
optdepends=(
  r-brms
  r-dotwhisker
  r-gamlss
  r-gamlss.data
  r-ggplot2
  r-glmmadaptive
  r-glmmadmb
  r-glmmtmb
  r-knitr
  r-lme4
  r-lmertest
  r-matrix
  r-mcmcglmm
  r-mgcv
  r-pander
  r-pbkrtest
  r-r2jags
  r-rmarkdown
  r-rstan
  r-rstanarm
  r-rstantools
  r-testthat
  r-tmb
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f06bfd7ddec2db64ef53cfb02bcb2c0dc90ec3c27e41236c2930820a79e3988c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
