# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shinyalert
_pkgver=3.1.0
pkgname=r-${_pkgname,,}
pkgver=3.1.0
pkgrel=1
pkgdesc="Easily Create Pretty Popup Messages (Modals) in 'Shiny'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-htmltools
  r-knitr
  r-shiny
  r-uuid
)
optdepends=(
  r-colourpicker
  r-shinydisconnect
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ee882788d0cf3d969c83cdfb39b19d12c6cab005bb850ec596164194a1d137be')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
