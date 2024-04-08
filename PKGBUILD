# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splancs
_pkgver=2.01-44
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Spatial and Space-Time Point Pattern Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-sp
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('44e5896425648e699fb0fe15fef191fc')
b2sums=('5a5b355941c1fc3da3ac67b34c0b132aa6b2cb20b21dcc1f01cc3fa9a09146b9bbfea3ed0fb67d89a4828edfc93550ed8377deac6fad535ec61a7414faf6df05')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
