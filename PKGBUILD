# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ARRmData
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example dataset for normalization of Illumina 450k Methylation data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6cfa96b213b0183de82248da05427075')
b2sums=('b337340c362864831919adf44cbefb7c2f9a08c50dad8bd8cc107565aec41cebf80c12ca1b1a86b894249b8ce39a9bcb6b3ebd4d13cf8c383a9940438124a02f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
