# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidybayes
_pkgver=3.0.4
pkgname=r-${_pkgname,,}
pkgver=3.0.4
pkgrel=1
pkgdesc="Tidy Data and 'Geoms' for Bayesian Models"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-arrayhelpers
  r-coda
  r-dplyr
  r-ggdist
  r-ggplot2
  r-magrittr
  r-posterior
  r-rlang
  r-tibble
  r-tidyr
  r-tidyselect
  r-vctrs
  r-withr
)
optdepends=(
  r-bayesplot
  r-bindrcpp
  r-brms
  r-broom
  r-covr
  r-cowplot
  r-distributional
  r-dotwhisker
  r-emmeans
  r-forcats
  r-gganimate
  r-ggrepel
  r-gifski
  r-jagsui
  r-knitr
  r-mcmcglmm
  r-modelr
  r-pkgdown
  r-png
  r-purrr
  r-rcolorbrewer
  r-rjags
  r-rmarkdown
  r-rstan
  r-rstanarm
  r-rstantools
  r-runjags
  r-svglite
  r-testthat
  r-transformr
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3f7c77913c58385571afb079de23b3044fbc740d6d8e18cb2b300f8b1c93d7bd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
