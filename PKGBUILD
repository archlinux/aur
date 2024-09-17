# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=timeSeries
_pkgver=4041.110
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Financial Time Series Objects (Rmetrics)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-timedate
)
optdepends=(
  r-ftrading
  r-performanceanalytics
  r-robustbase
  r-runit
  r-xts
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b8c7515597103baad42e956df76951d6')
b2sums=('8da61ab22d27b17c78d0ffcf2f5150c1e30df12bcbd5aafe130e5523d0d55568025ca45f3bec97cb2dcfebb55f2553aeec1598822a68cef3409c23bea5115a15')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
