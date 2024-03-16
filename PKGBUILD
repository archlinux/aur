# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=dotCall64
_pkgver=1.1-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Enhanced Foreign Function Interface Supporting Long Vectors"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-microbenchmark
  r-rcolorbrewer
  r-rhpcblasctl
  r-roxygen2
  r-spam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('daf0febb534609e779c515d35795175c')
b2sums=('898a974de53f98672fbd3365b1ba433529dd82c6f7ad1cfc9a645b2c724afbc7ffec6e0f0185b9391d054728e9d230ac0a4204c13c8915a9f6ece637e2e40b0b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
