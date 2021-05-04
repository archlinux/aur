# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_cranname=colorspace
_cranver=2.0-1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Toolbox for Manipulating and Assessing Colors and Palettes"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(BSD)
depends=('r>=3.0.0')
optdepends=(r-kernsmooth r-kernlab r-mvtnorm r-vcd r-shiny r-shinyjs r-ggplot2 r-dplyr r-scales r-png r-jpeg r-knitr r-rmarkdown r-rcolorbrewer r-rcartocolor r-scico r-viridis r-wesanderson)
source=("${pkgname}-${pkgver}.tar.gz::https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('f82fdde36058678d1bd0f410eb45a5874aa28d74e2de30399f28b070a284425e')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${pkgname}-${pkgver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
