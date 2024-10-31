# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mdqc
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mahalanobis Distance Quality Control for microarrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f277ca29f77be3efbbc0ed040ca57c5c')
b2sums=('1f5dedf53cf1e00e7fb7230b334f7323696b1701948e27193a7b0457dfcce2a0cbf0fdde06218c052bf15ea4b7498d3c1fb3d09e05bb6750e613671e5fa6bd70')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
