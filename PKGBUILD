# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=shinydisconnect
_pkgver=0.1.1
pkgname=r-${_pkgname,,}
pkgver=0.1.1
pkgrel=1
pkgdesc="Show a Nice Message When a 'Shiny' App Disconnects or Errors"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-checkmate
  r-glue
  r-htmltools
  r-shiny
)
optdepends=(
  r-colourpicker
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4c7ec442b965b4645b2e9fc0eab2c45b0009316735dace23227f5f89babb17fa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
