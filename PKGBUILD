# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msm
_pkgver=1.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multi-State Markov and Hidden Markov Models in Continuous Time"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-expm
  r-generics
  r-mvtnorm
  r-tibble
)
optdepends=(
  r-covr
  r-doparallel
  r-flexsurv
  r-foreach
  r-minqa
  r-mstate
  r-numderiv
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('042ffe5ad7a5c7cd92bccff8a5de104f')
b2sums=('5e57b6ad0c2a806b4c85f0704c08a0372c337d4a149c176812b7506c3c4c4009ff6af67a9336db8721fd9284d207b3c776da01172c592442dd3f8129ff0d5372')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
