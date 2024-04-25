# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DDRTree
_pkgver=0.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Learning Principal Graphs with DDRTree"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-irlba
  r-rcpp
)
makedepends=(
  r-bh
  r-rcppeigen
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b9970fe30d198db164d071f87abd17a5')
b2sums=('0ac4018cfe0828f0451a545d37ebe93b4a3a63df79ee373cd7826b30632913794ced043a077e167d9f77211d1870ff443ce252a7035489a73f21afd42bb67f7e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
