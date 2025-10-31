# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBarrays
_pkgver=2.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unified Approach for Simultaneous Gene Clustering and Differential Expression Identification"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f372dcca9e7b41430805b44320d98ae9')
b2sums=('10f9bd9197980882d80a3c8a60874656e269a34319ab3dd718805a72afa8e5af7f99ebe3db1ffbd10f68dfdfd5e9d97d1261af554d0d76cd6a59f08b2263ac8d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
