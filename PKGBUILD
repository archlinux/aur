# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ggVennDiagram
_pkgver=1.5.0
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
  r-venn
  r-yulab.utils
)
optdepends=(
  r-knitr
  r-plotly
  r-rcolorbrewer
  r-shiny
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e225a0b374c62445bff961725fbdd9c0')
b2sums=('ca20a5c335c2c34776ca5a7d9894b25eb05960408a9f6f4334a8ed026edb1813d6ec2a69fe3c2bc5ca51a6f0d07451d858245cf136f1a664b1f72778d26534c8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
