# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spsComps
_pkgver=0.3.2.0
pkgname=r-${_pkgname,,}
pkgver=0.3.2.0
pkgrel=4
pkgdesc="'systemPipeShiny' UI and Server Components"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-assertthat
  r-crayon
  r-glue
  r-htmltools
  r-magrittr
  r-r6
  r-shiny
  r-shinyace
  r-shinytoastr
  r-stringr
)
optdepends=(
  r-shinyjqui
  r-spsutil
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('57246223508d7b11e196ea53f28c65aedc117be3bce3679f6d53462ba589b1d9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
