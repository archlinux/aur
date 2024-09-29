# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Ternary
_pkgver=2.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create Ternary and Holdridge Plots"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-plottools
  r-rcpphungarian
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
md5sums=('805bd186c460257eafcfca77d6e858f0')
b2sums=('de06c72aadc99db8f33aa2be4dbbadb32ab9552e99a98948d37ebd05fc5ace8f011aa6adf2fda61386e6e5e23e2d3376bed87bda70acdf6f6dc00488c95ff707')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
