# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ECOSolveR
_pkgver=0.6.1
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
md5sums=('59c3857fa545cc08c4cd1c2b3fd9bacb')
b2sums=('da13c68b7d13df8a7d59a7808dc68e353166cafb5389ee8bec55cf16dc7a6e9f7cb5fc9620af4c41434df1e598bbd01a78b83b2b0275c1835ea0a94d4e3cca2c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
