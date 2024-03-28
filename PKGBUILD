# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biganalytics
_pkgver=1.1.22
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utilities for 'big.matrix' Objects from Package 'bigmemory'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only OR Apache-2.0')
depends=(
  r-biglm
  r-bigmemory
  r-foreach
)
makedepends=(
  r-bh
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a6dadd3f2c7b62fd90ac527cbfa1fe02')
b2sums=('5e65fa8a24eb685df41266ed760ee4e529cb3fb47bfeae454166378bf00fb30794067d4480a2c3284c1b63d808390fc84dc88e117ebb05049dfce8489455da15')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
