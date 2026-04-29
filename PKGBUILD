# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gpls
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Classification using generalized partial least squares"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f3d915e8bc98b33dc4f6a5856ce7c03b')
b2sums=('0e203cd485275b0450188f35dc4ba5d9c292b7b236e32cf6fed28882fd8837e11c66f2c309e5807eced7fc9a05a87b0357f165941d70603f8c5d5f9c9f55fbc3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
