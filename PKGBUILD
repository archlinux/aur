# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svGUI
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'SciViews::R' - Manage GUIs in R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('036a6d94ddd371f00dad1a585a6f4a9c')
b2sums=('83709dd99f90e45ca054d90f96cdb37ab1de2482a52dcdb3411e6ac228f4d7281ad03f9390a48fa85266211427210763b2cf9a0a72ce876688cc7f7cc4e88f7c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
