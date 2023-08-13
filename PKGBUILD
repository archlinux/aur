# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidybayes
_pkgver=3.0.6
pkgname=r-${_pkgname,,}
pkgver=3.0.6
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
sha256sums=('706044e17855a684a5ad1aeb582963dd3c7192a4a8ad0584358d0ea7c7aadb90')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
