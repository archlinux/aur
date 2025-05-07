# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=softImpute
_pkgver=1.4-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Matrix Completion via Iterative Soft-Thresholded SVD"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c55dbeb781905a0d97a49edb6ddbda8')
b2sums=('521bd446cefd5e712f31eaa542447d1feef91985db01def6aae2796301dfbc9045f9d982b427a9034c8c0991a7bdbc3bcbc410328c5d4903c1e13984059886e1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
