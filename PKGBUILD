# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reactable
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=0.3.0
pkgrel=6
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
  r-leaflet
  r-mass
  r-rmarkdown
  r-shiny
  r-sparkline
  r-testthat
  r-tippy
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('38e4d49a235f6900e6d7dcb33245c925860edf0b3eb443c78ee0330b6a0c304d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
