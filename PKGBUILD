# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pamr
_pkgver=1.57
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Pam: Prediction Analysis for Microarrays"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('202fed18bb22ccdfe73d002533d57f5d')
b2sums=('72f12c74c24b9fe2538f2c2e0bc130cb31dab6a28070a205c7b3052be5f267e52b0dd3a83b4513df8ae8636785813fba01cd4bac43f00501bb0838388348da2b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
