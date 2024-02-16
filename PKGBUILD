# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qlcMatrix
_pkgver=0.9.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Utility Sparse Matrix Functions for Quantitative Language Comparison"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-docopt
  r-slam
  r-sparsesvd
)
optdepends=(
  r-knitr
)
source=("https://cran.r-project.org/src/contrib/Archive/$_pkgname/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3b0734cb96c9cae62f760de1d4a4a8a7')
b2sums=('4985f5c329070efa2565f0d531938b0d5be653757ba9d62082d3b98294b389f3c5d0394a6fda8a8cf21aad94d0bb53bbbadeaf7ff3c66627787fc2052de47080')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
