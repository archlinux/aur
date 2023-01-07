# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reactable
_pkgver=0.4.3
pkgname=r-${_pkgname,,}
pkgver=0.4.3
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
sha256sums=('97fd4bc79ddbf22f1ac5ddaf6aae8d32cc3ac953b0446fdb5140cda319c3feec')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
