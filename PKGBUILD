# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Ternary
_pkgver=2.3.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create Ternary and Holdridge Plots"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-clue
  r-plottools
  r-shiny
  r-sp
)
optdepends=(
  r-colourpicker
  r-knitr
  r-readxl
  r-rmarkdown
  r-shinyjs
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e0748bb78ef0530c203ca46082e57ff0')
b2sums=('961b30b1901e77ef2c7b346f139544b4295e0c99ba1c98aa1f9b0c622e360b83451a7d03dd830044264827f738f81c1d778c2d8277f3413ddd6424e16e63fd97')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
