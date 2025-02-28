# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=segmented
_pkgver=2.1-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Regression Models with Break-Points / Change-Points Estimation (with Possibly Random Effects)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4a998f6e5bdcd4ed1d358ad88ab52e7b')
b2sums=('f760e1a4713d98b7cef424f219270674667a225d34ec4ce5312f09e94e35356f73b65a9dc13043b211651d716a4d8e93d8a1936cf7e7493acbdb4e3c987c9b5d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
