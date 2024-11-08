# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msm
_pkgver=1.8.2
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
md5sums=('47fc1452e397d2af8ebe84b7819d34f9')
b2sums=('5d84b694358e905d3722ede5f3796d2172b241c2d6c280ce91447a182e259c372183e1475478fd9f00910fab3f25c6733ca79fa78bbc3b8058adb5f929169758')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
