# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=softImpute
_pkgver=1.4-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Matrix Completion via Iterative Soft-Thresholded SVD"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('560bb9c13193b8ae1a2055eef1f1543b')
b2sums=('68c6a4f268e32ff6fd3a2948d3e31d8f22eaca18d980326f5938a5d8282f91298923f25450ede3a19e0dd7b1fad2c0f3adb51a0c21c31c4496a2719ac0aa7d9d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
