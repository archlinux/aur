# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tictoc
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions for Timing R Scripts, as Well as Implementations of \"Stack\" and \"StackList\" Structures"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0cbeed08aded314a387b93d59420e371')
b2sums=('3fa1a833f87b163c92e207f071800ce3bf4fa266c399a6289ea3170fc7039b45eb8dcb58af0357aa09287e39e90baadf8c1f7fd737827308afafd28ec4dfcbc7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
