# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reactable
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=0.4.2
pkgrel=1
pkgdesc="Interactive Data Tables Based on 'React Table'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-digest
  r-htmltools
  r-htmlwidgets
  r-jsonlite
  r-reactr
)
optdepends=(
  r-covr
  r-crosstalk
  r-dplyr
  r-fontawesome
  r-knitr
  r-leaflet
  r-mass
  r-rmarkdown
  r-shiny
  r-sparkline
  r-testthat
  r-tippy
  r-v8
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('80448ab11af6b721e8b20d88c7c55421463ec63e0bd930b73d626824d1bfa157')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
