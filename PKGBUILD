# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Ternary
_pkgver=2.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Create Ternary and Holdridge Plots"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-plottools
  r-rcpphungarian
  r-shiny
  r-sp
  r-viridislite
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
md5sums=('d42dcc4886855e493e88db7eeff8d1f5')
b2sums=('a7c3779e19d5adc8926ea81863daf30c6f24553ec883f377db04f7e4414d94e021a9c7bb301cf867508184131586f336e3dce1bb23312378a6283c804a26ef80')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
