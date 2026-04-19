# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=manipulateWidget
_pkgver=0.11.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Add Even More Interactivity to Interactive Charts"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2 GPL3)
depends=('r>=2.10' 'r-shiny>=1.0.3' r-miniui r-htmltools r-htmlwidgets r-knitr r-base64enc r-webshot r-shinyjs)
optdepends=(r-dygraphs r-leaflet r-plotly r-xts r-rmarkdown r-testthat r-covr)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4b6044517d11bee732cd3a58eabf29b1f1330d328365dbc6cf252f19215684de')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
