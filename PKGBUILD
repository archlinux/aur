# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cvms
_pkgver=1.3.8
pkgname=r-${_pkgname,,}
pkgver=1.3.8
pkgrel=1
pkgdesc='Cross-Validation for Model Selection'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-checkmate
  r-data.table
  r-dplyr
  r-ggplot2
  r-groupdata2
  r-lifecycle
  r-lme4
  r-mumin
  r-parameters
  r-plyr
  r-proc
  r-purrr
  r-rearrr
  r-recipes
  r-rlang
  r-stringr
  r-tibble
  r-tidyr
)
optdepends=(
  r-auc
  r-covr
  r-e1071
  r-furrr
  r-ggimage
  r-ggnewscale
  r-knitr
  r-merderiv
  r-nnet
  r-randomforest
  r-rmarkdown
  r-rsvg
  r-testthat
  r-xpectr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9a2a5ba293a0a091c9aafd4e16169966eab513a1ad8cbec4f3310fec90eebd40')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
