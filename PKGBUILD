# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=densEstBayes
_pkgver=1.0-2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Density Estimation via Bayesian Inference Engines"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  onetbb
  r-rcpp
  r-rstan
  r-rstantools
)
makedepends=(
  r-bh
  r-rcpparmadillo
  r-rcppeigen
  r-rcppparallel
  r-stanheaders
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d9bacbd697be98f3907429dcee5e969d')
b2sums=('e232720a81d91bb15884f3989db30e031db0466b9e054f39641e55c5e2281787e12fc9c0747989a1d0720794fc3e5ba641a92c1a076ba9f2ad521219e9353d97')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
