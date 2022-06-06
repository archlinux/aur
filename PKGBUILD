# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=emmeans
_pkgver=1.7.4-1
pkgname=r-${_pkgname,,}
pkgver=1.7.4.1
pkgrel=3
pkgdesc='Estimated Marginal Means, aka Least-Squares Means'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-estimability
  r-mvtnorm
  r-numderiv
  r-xtable
)
optdepends=(
  r-bayesplot
  r-bayestestr
  r-biglm
  r-brms
  r-car
  r-carbayes
  r-coda
  r-coxme
  r-gee
  r-geepack
  r-ggplot2
  r-knitr
  r-lattice
  r-lme4
  r-lmertest
  r-logspline
  r-mass
  r-mcmcglmm
  r-mcmcpack
  r-mediation
  r-mgcv
  r-mice
  r-multcomp
  r-multcompview
  r-mumin
  r-nlme
  r-nnet
  r-ordinal
  r-pbkrtest
  r-pscl
  r-rmarkdown
  r-rsm
  r-rstanarm
  r-scales
  r-sommer
  r-splines
  r-survival
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f7a33a2b54ad13d6e39ee6c58004f83a9edb06e8dc8282180440610eb18be721')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
