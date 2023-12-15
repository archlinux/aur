# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pamr
_pkgver=1.56.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Pam: Prediction Analysis for Microarrays"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL2)
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e7afaadee109e93944e3feb793c3a90d')
b2sums=('ff826e4a4b088c5e919d346a03258d9780da740f2546151f6046eb18c7fe3bc5b2a2719001cb933e4e04a34f28f95827347d4243df97b0cb3762876087475652')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
