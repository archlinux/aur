# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cvms
_pkgver=1.3.5
pkgname=r-${_pkgname,,}
pkgver=1.3.5
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
  r-groupdata2
  r-knitr
  r-nnet
  r-randomforest
  r-rmarkdown
  r-rsvg
  r-testthat
  r-xpectr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('06adf42f4e348a5980baee6574254b052fb9b68a866a11376d5074b1dcd74935')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
