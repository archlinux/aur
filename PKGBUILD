# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=clinfun
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Clinical Trial Design and Data Analysis Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-mvtnorm
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('35666b8eeccde9f0bd826048ba91d647')
b2sums=('d5227495beb5c76303d5ec498e35a72e81d0cd46bb1728cee7eba32a5bd0c3c67c2f7a9d3e15b954eebb8b314524819862648903231cfdaf5ac27e89d0b222e6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
