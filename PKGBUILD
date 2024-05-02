# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gpls
_pkgver=1.76.0
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
md5sums=('f96edbb21515f81e81359eb7107e6b0d')
b2sums=('efb8ac48b221b4e2feb2f32cf5028b60ad18c7f259ce3158b611527c647c2d6a977123cedd6f95f781f4f0b3bf3519cf9a2591abe8db8f92f3a9a92f7e16b120')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
