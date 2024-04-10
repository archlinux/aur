# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sagenhaft
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Collection of functions for reading and comparing SAGE libraries"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-sparsem
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4f27450a0e98b4f0f7396a784eb0e4e3')
b2sums=('43f4fb5d8911aa198667ced7508948b2bb9053f51b28f9b4db6da6d719995a554adda8b0ba5bf64d782408d369da9892d3e918f1ba8539acdef469acf414db11')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
