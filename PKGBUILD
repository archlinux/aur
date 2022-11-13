# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=survivalAnalysis
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='High-Level Interface for Survival Analysis and Associated Plots'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-cowplot
  r-dplyr
  r-forcats
  r-ggplot2
  r-gridextra
  r-magrittr
  r-purrr
  r-rlang
  r-scales
  r-stringr
  r-survminer
  r-tibble
  r-tidyr
  r-tidytidbits
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-tidyverse
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('eef98a2d2517c3367b89f6054ef1ba19302f5bbf819dbc17fb243d282b8c8c68')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
