# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Ternary
_pkgver=2.3.4
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
md5sums=('376f248de2f17a855da11383d571eb17')
b2sums=('f1cc6047fe8ffb3c18fc52697e97a3269217e93cc9d2a73b1b5b3377c016120e190f7485bfbc4c8a0756016a1e4438fe66b3385802c2ee0341c652cffcb0a646')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
