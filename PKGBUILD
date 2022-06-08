# Maintainer: Robert Greener <me@r0bert.dev>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=shinyWidgets
_cranver=0.7.0
_updatedate=2022-06-08
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Custom Inputs Widgets for Shiny"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.1.0' r-bslib r-sass 'r-shiny>=1.6.0' r-jsonlite)
optdepends=(r-shinydashboard r-testthat r-covr r-shinydashboardplus r-bs4dash r-argonr r-argondash r-tablerdash r-ggplot2 r-dt r-scales)
source=("https://cran.microsoft.com/snapshot/${_updatedate}/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('d4cb8ab7a96861a819128f9deeb293e8178f90fcd51f0e84467161ca7cd36711')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
