# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scrime
_pkgver=1.3.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of High-Dimensional Categorical Data Such as SNP Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-dbi
  r-oligoclasses
  r-rsqlite
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('09432381612e8c11a55d66c073f4f980')
b2sums=('45d9fd1aa4176b84e452cf6fb03ed905466017be9d930cc6ee82beaa175ad9e2ef4193964b35dd6276e0af7dfcde3bf76d3f31dd01991d7d2125f82da633a184')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
