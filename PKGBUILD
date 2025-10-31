# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Clomial
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infers clonal composition of a tumor"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-matrixstats
  r-permute
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2af50fc04b927377303daf4ae6a11ad1')
b2sums=('18e86e40df9cf60f681d99e18adebf40d5ea8e2fb2488124f937e253ff733ea5381d6cd74f50ac0b578fc234e923e6dbf144238dfa3194676fed122367391281')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
