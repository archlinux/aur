# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geigen
_pkgver=2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Calculate Generalized Eigenvalues, the Generalized Schur Decomposition and the Generalized Singular Value Decomposition of a Matrix Pair with Lapack"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  blas
  lapack
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('08951fde411893278e127769a9cfa394')
b2sums=('7d5b1df9c1ed49b61cb93be5470e22b5c73b1ff54db1abc82892d5397a1fda3e6c02b8430d79a7106b8ea421dfd9f5b102e225dfb0847a6bb87e1528a3774028')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
