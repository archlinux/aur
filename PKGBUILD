# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=msm
_pkgver=1.8.1
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
md5sums=('e1fee93e4564bf55b0468c5da30f2fbc')
b2sums=('74ab547e806f5be91ae38abc0a7325f077569f5c9892eb26e5eab428268f0017b81a17ef66f9f6230318ad296a2468cd4ced211c89bb858f4a3d871f688d3659')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
