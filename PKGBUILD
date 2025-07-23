# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spsComps
_pkgver=0.3.4.0
pkgname=r-${_pkgname,,}
pkgver=0.3.4.0
pkgrel=1
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
sha256sums=('a8e3257583507f2a8163e730d94843cc161658dd9298317bd49c2fd55ef4c9d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
