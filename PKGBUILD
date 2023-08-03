# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=densEstBayes
_pkgver=1.0-2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Density Estimation via Bayesian Inference Engines"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  blas
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
sha256sums=('8361df9cd4b34fabfca19360bb680a8a3c68386a72bb69cf00dfa19daf97b679')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
