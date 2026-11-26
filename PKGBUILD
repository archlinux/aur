# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=occugene
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions for Multinomial Occupancy Distribution"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c9416ae34460c9fe55f481dafd63f749')
b2sums=('8e4dda2093ca286323ad63fa453b394ed035c7c70a6484fb8d9c02a63d04bcb43a45b813a009a875d8a7888361436accfded04995950217353afacf9eb436a8e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
