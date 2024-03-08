# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=desirability
_pkgver=2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Function Optimization and Ranking via Desirability Functions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6597122db76d97f04c66556d66bbd2d5')
b2sums=('63810972528557734e57bdf3a5c2db98bf8cbcb95c419b12ef34c3cf0243c13ad64f654789c96c33f2ec5345d5df6da3974a2ef639d0f589ef064d3ce96fda37')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
