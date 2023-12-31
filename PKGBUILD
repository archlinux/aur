# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ECOSolveR
_pkgver=0.5.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Embedded Conic Solver in R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL3)
depends=(
  r
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-slam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6eef63b5a9ca57cf252bdb4eb705bc9e')
b2sums=('c61a511e081de6ba03a35a67392b530297de07d8a97994eea9d52f28d70283f79234b1a4b44b8eb62c85c1906c81656e53890063f8ab90f8eb5874437e2eae9b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
