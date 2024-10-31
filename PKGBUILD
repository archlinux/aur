# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iASeq
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="integrating multiple sequencing datasets for detecting allele-specific events"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d34b9d842ac1e44587242916ab97db12')
b2sums=('1a43644c0069be1de72bf68e0485d5bf42e9b929f54705b441df05c3043f5e65348dc31b55c8101d1b56392a2d755c5731a1e5835a37ce370bd09e31d7fbb4c4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
