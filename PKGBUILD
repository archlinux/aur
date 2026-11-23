# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=GPvecchia
_pkgver=0.1.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Scalable Gaussian-Process Approximations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-fields
  r-fnn
  r-gpgp
  r-rcpp
  r-sparseinv
)
makedepends=(
  r-bh
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-mvtnorm
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dd5ef8322abb616b8f4d5edd76f0010d')
b2sums=('eb5f7e6f531fc40a0640e61e01c2c4cd86aae43cf20baa6e328dbf70ae809a6f119b19a75952732ae0d65fe28732b8a7573cf6e3a28030bab729730b7c4b4d1e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
