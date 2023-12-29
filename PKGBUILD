# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FNN
_pkgver=1.1.3.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Fast Nearest Neighbor Search Algorithms and Applications"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
optdepends=(
  r-chemometrics
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e05bd9b5adef28dc6e0cdfed2b994064')
b2sums=('2d13e0b6a32b3cc285cc81512e704be1a3eea01f4f3b23d11a67c2489366122d59635d83fc9eae2af9b01d711d0e33dc0a70d352c398c27df25bb6388dcfa594')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
