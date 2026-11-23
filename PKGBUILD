# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=fastmatrix
_pkgver=0.6-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Fast Computation of some Matrices Useful in Statistics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
  blas
  lapack
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('68a59c07134d881015f9154496b7228b')
b2sums=('c285ede9cf89eda10a3c3dba5320e18523be65116dd580630c8bdfbecbc809fd2a7644ebbeff1b8d62eb260dcff42fe3a71b64075d4bedbdff59532feacc0ef0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
