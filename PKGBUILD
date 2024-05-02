# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBarrays
_pkgver=2.68.0
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
md5sums=('18528a280c378bf2215d1072df2b7efe')
b2sums=('868a4ed75e0f2fc609ecdf5510b18fa88e1187437f28f67d22792ba90dbbb934ab331f3d6459f9a6810f05326388e96b4463cda1ac808c16f5085a9c6ba9b1c6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
