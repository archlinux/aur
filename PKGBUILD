# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RLMM
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Genotype Calling Algorithm for Affymetrix SNP Arrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4b5d39c5583b4bbf14d8f00ac9675354')
b2sums=('b0c6fe920dfa84bf64250e583b81c71cc8eaa3fe0e146c6073420f418a1824569da3a5ebd0e5ece453aa1ea72f0a43a7a34fd8c8ad8381336629b5602405000a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
