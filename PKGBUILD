# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svDialogs
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'SciViews::R' - Standard Dialog Boxes for Windows, MacOS and Linuxes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-rstudioapi
  r-svgui
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
  yad
  zenity
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f78e4b16b1afe8a30572859898d84da3')
b2sums=('1fc88f571ab0798a807c59822ad6be7317a5a2305f30a51d6381b348d585f2e02f1ddcc973701d2db4d4f058efd76fce6d4d484f8c662d5a1ad11b48cebd2125')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
