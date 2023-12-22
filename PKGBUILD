# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ggVennDiagram
_pkgver=1.4.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A 'ggplot2' Implement of Venn Diagram"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL3)
depends=(
  r-aplot
  r-dplyr
  r-forcats
  r-ggplot2
  r-tibble
  r-tidyr
)
optdepends=(
  r-knitr
  r-plotly
  r-rcolorbrewer
  r-rmarkdown
  r-shiny
  r-testthat
  r-venn
  r-yulab.utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8bbc17808fb44aececaf7ebeedb54a44')
b2sums=('2ab2f9a27ed661d8d54242875e2bdfaf28006989850b3595f2e4be11e3ca7e5f011c03dd45bff546f0abb853571b6e07215405ea0d7bbba179d0be836e60927f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
