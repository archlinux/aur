# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=shinyWidgets
_cranver=0.6.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Custom Inputs Widgets for Shiny"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.1.0' r-bslib r-sass 'r-shiny>=0.14' r-htmltools r-jsonlite)
optdepends=(r-shinydashboard r-testthat r-covr r-shinydashboardplus r-bs4dash r-argonr r-argondash r-tablerdash r-ggplot2 r-dt r-scales)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('609f923997609f16e64f35d74513a7cd')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
