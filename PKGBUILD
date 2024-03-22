# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: portaloffreedom

_pkgname=repr
_pkgver=1.1.7
pkgname=r-${_pkgname,,}
pkgver=1.1.7
pkgrel=1
pkgdesc='Serializable Representations'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-base64enc
  r-htmltools
  r-jsonlite
  r-pillar
)
optdepends=(
  r-cairo
  r-data.table
  r-geojsonio
  r-highr
  r-htmlwidgets
  r-leaflet
  r-methods
  r-plotly
  r-stringr
  r-testthat
  r-tibble
  r-vegalite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('73bd696b4d4211096e0d1e382d5ce6591527d2ff400cc7ae8230f0235eed021b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
