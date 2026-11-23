# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=crs
_pkgver=0.15-46
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Categorical Regression Splines"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-quantreg
)
optdepends=(
  r-ggplot2
  r-knitr
  r-logspline
  r-quadprog
  r-rgl
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0ef6a6366557ce73942dfae5e49a0202')
b2sums=('6c5d040e930b3dd9f7d83fae0f708432f19507e533bd2ea9a35dd591df565cf4d70e5c415632f327f89ed62fe32943dfad2e8e155ca8fc085717d7af61d31f1f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
