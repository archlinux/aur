# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=additivityTests
_pkgver=1.1-4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Additivity Tests in the Two Way Anova with Single Sub-Class Numbers"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0aa55442e90e17042e1fdb78b29c525c')
b2sums=('fdddc851dc30942495272e759e06965a6cda841de4c7b7edb113beb74f2d96b5116f8d30f9c7a5f001377350e7d8d26d1c503957827d5cbb7ebf953f3f1488c7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
