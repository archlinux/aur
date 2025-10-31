# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bladderbatch
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bladder gene expression data illustrating batch effects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0d9f1eefcf729bb007307d4257d5a8fb')
b2sums=('7d1890009689accf79146ed0e96052cb6e39bed0183a21b7b1e5e7e78e02adf2a3289aa07d6634f687fc87c1e2b44f2f35061e45ebd3467b0c06993676b3c14a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
