# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=emmeans
_pkgver=1.8.8
pkgname=r-${_pkgname,,}
pkgver=1.8.8
pkgrel=1
pkgdesc='Estimated Marginal Means, aka Least-Squares Means'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-estimability
  r-mvtnorm
  r-numderiv
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
  r-sandwich
  r-scales
  r-sommer
  r-splines
  r-survival
  r-testthat
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5218160caeff71ae2466a185882c6c6f76c1db05713110201b4eebb9d9dfbaec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
