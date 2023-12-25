# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Ward Segers <w@rdsegers.be>
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=irlba
_pkgver=2.3.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Fast Truncated Singular Value Decomposition and Principal Components Analysis for Large Dense and Sparse Matrices"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL3)
depends=(
  blas
  lapack
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f738200d5272c7258ee59f7074dd4a6a')
b2sums=('5255a275a2aceec0cb931529eaf67d30ee5058cee5a4c09977f56c9f142d2f3d545b86f4fa220cac5b4b69b93de9efac7b2bd9f6330363f716139be5607e46fd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
