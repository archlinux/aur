# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ggVennDiagram
_pkgver=1.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A 'ggplot2' Implement of Venn Diagram"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-aplot
  r-dplyr
  r-forcats
  r-ggplot2
  r-tibble
  r-venn
  r-yulab.utils
)
optdepends=(
  r-knitr
  r-plotly
  r-rcolorbrewer
  r-rmarkdown
  r-shiny
  r-testthat
  r-tidyr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('25718bbd19e6bf11b4dea69609664d64')
b2sums=('dad9a840703a87b479075655f264f8b4a2cb6b87502111c173437a47f21b47157cf1dcee922f1f924e06bbc76707cda3cd8a6017cb39f8e60abe6889844553db')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
