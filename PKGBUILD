# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=groupdata2
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=2.0.2
pkgrel=3
pkgdesc='Creating Groups from Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-checkmate
  r-dplyr
  r-lifecycle
  r-numbers
  r-plyr
  r-purrr
  r-rearrr
  r-rlang
  r-tibble
  r-tidyr
)
optdepends=(
  r-broom
  r-covr
  r-ggplot2
  r-knitr
  r-lmertest
  r-rmarkdown
  r-testthat
  r-xpectr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('85bee0a66d777414c1873bf661a95fdba88aad5a8bab1a157187f30e5ef198c5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
