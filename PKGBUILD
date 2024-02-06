# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggvis
_pkgver=0.4.9
pkgname=r-${_pkgname,,}
pkgver=0.4.9
pkgrel=1
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
sha256sums=('69b9d184789c90aedd2f336d43033a8b710a16b052580bf9e7ce229ac25ba12f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
