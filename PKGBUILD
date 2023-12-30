# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wavethresh
_pkgver=4.7.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Wavelets Statistics and Transforms"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1e88d73de0dfee4283b44f474c50b427')
b2sums=('3335d9e8834165fe69f5f97694fc04d5011a1d3025476c15f920714e1c121a515317287bcdd250fec9b9fdcb0b0f522f1ed5e4547af2d234ade2f68c9268a3f1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
