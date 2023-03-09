# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggvis
_pkgver=0.4.8
pkgname=r-${_pkgname,,}
pkgver=0.4.8
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
sha256sums=('3d5480a0b97a57c26b595785f826b13d7695dab1f1dd8fcf5d7964fa8546a26a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
