# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=PlotTools
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Extended Tools for Continuous Legends, Polygon Manipulation, and Visual Display of Categorical Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sp
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a94d4c266b1e71489ca8d26fb9fbed45')
b2sums=('77e19777476f4ad50d18cec90b01a22840ff3b508894c3731fac2ec42b587915e7aec98ea8b5dc0499ad648a3d9b97b4dfca500848f25fe63dc0bdd7ff9a0d7b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
