# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=manipulateWidget
_cranver=0.11.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Add Even More Interactivity to Interactive Charts"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=2.10' 'r-shiny>=1.0.3' r-miniui r-htmltools r-htmlwidgets r-knitr r-base64enc r-webshot r-shinyjs)
optdepends=(r-dygraphs r-leaflet r-plotly r-xts r-rmarkdown r-testthat r-covr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('f2953494a08babba972e9dcc293f767371ccf5c8d0f4d67b78dba1a50c7dda47')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
