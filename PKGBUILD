# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FNN
_pkgver=1.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Nearest Neighbor Search Algorithms and Applications"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
optdepends=(
  r-chemometrics
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('556e18063f6b54ff3d3117c4d8360215')
b2sums=('d245eec52f85456054a6fa701d0cb51077d9bef3d08e839795e735b40ee5f625a751c51c2fbfe04c0705fd5bc1994fc9b28e801c3294b6ee96732f861d74082b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
