# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggvis
_pkgver=0.4.7
pkgname=r-${_pkgname,,}
pkgver=0.4.7
pkgrel=4
pkgdesc='Interactive Grammar of Graphics'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-dplyr
  r-htmltools
  r-jsonlite
  r-magrittr
  r-rlang
  r-shiny
)
optdepends=(
  r-knitr
  r-lubridate
  r-mass
  r-mgcv
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9e6b067e11d497c796d42156570e2481afb554c5db265f42afbb74d2ae0865e3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
