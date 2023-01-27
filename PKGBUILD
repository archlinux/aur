# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: portaloffreedom

_pkgname=repr
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=1.1.6
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
sha256sums=('3d2e6c9b363c1ec4811688deff7fb22093cadc9e0a333930382093d93c16673f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
