# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ggVennDiagram
_pkgver=1.5.7
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
md5sums=('2265f1939424e6335143ebbd2580e584')
b2sums=('25e5caa695183197bdada882768302b79ad96e6c513b5e8f214f3d1c9983d32770ddb1986433f2fec0f2d33ad5acd516d251e544fc2bbed5de1fc4b4d448c0d4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
