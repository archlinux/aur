# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ECOSolveR
_pkgver=0.6.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Embedded Conic Solver in R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-cli
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-slam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ba49d6523d1a49089f87e252cd8486d5')
b2sums=('6400988f6231e7b6b1791942bb2e1797bf6b858d499f50619f91897b524b55822f04be4e310b92234878425a44dda3fad5fb7ecac2cc866139e0c8349b825c0e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
