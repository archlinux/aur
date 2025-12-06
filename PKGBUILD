# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=blavaan
_pkgver=0.5-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian Latent Variable Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  onetbb
  r-bayesplot
  r-coda
  r-future.apply
  r-igraph
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
  r-blavsam
  r-cmdstanr
  r-modeest
  r-rjags
  r-runjags
  r-semtools
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('43c89fcf50efe74fa3e33478d1e0cd64')
b2sums=('b6819fbd3feb08e0d580ac4af323bdec7c6584a962815624236b31c697baf37beea9607aa5c5496256e10bf84ddeace3df09f49e1f062f37eb7fd068dc474221')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
