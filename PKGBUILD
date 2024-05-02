# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=censcyt
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Differential abundance analysis with a right censored covariate in high-dimensional cytometry'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocparallel
  r-broom.mixed
  r-diffcyt
  r-dirmult
  r-dplyr
  r-edger
  r-fitdistrplus
  r-lme4
  r-magrittr
  r-mice
  r-multcomp
  r-purrr
  r-rlang
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3e1f70c86246fd9426418fc58d0f280bafa68b732d14a344ee943bba73201a1d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
