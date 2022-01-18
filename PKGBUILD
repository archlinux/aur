# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=editData
_cranver=0.1.8
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="'RStudio' Addin for Editing a 'data.frame'"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=2.10' 'r-shiny>=0.13' 'r-miniui>=0.1.1' 'r-rstudioapi>=0.5' 'r-dt>=0.17' r-tibble r-dplyr r-rio r-magrittr r-shinywidgets r-openxlsx)
optdepends=(r-knitr r-rmarkdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('d468192c88f7feb8d166d9d2bb0b0fdf5201dfbe662d54a009477e62c445119c')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
