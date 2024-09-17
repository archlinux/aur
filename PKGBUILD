# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=blavaan
_pkgver=0.5-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Bayesian Latent Variable Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  onetbb
  r-bayesplot
  r-coda
  r-future.apply
  r-lavaan
  r-loo
  r-mnormt
  r-nonnest2
  r-rcpp
  r-rcppparallel
  r-rstan
  r-rstantools
  r-tmvnsim
)
makedepends=(
  r-bh
  r-rcppeigen
  r-stanheaders
)
optdepends=(
  r-cmdstanr
  r-modeest
  r-rjags
  r-runjags
  r-semtools
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('635d7b1dd9e2198ac021f0cd917023c8')
b2sums=('6263314e73bea29f498d722335e1fa534a88cc9e2ac8517429749f1dfb5932cba2136910e94561d5a74c961440bb60509a0fb06ba654bf6bfea7b708205c2902')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
