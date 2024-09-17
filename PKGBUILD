# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=EBMAforecast
_pkgver=1.0.32
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Estimate Ensemble Bayesian Model Averaging Forecasts using Gibbs Sampling or EM-Algorithms"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-abind
  r-glue
  r-gtools
  r-hmisc
  r-plyr
  r-rcpp
  r-separationplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9d0a24db4680ec2bc5a8261c9ae7a5be')
b2sums=('65c6bdf6069b2b62f98d4d5fdf8107f2a53b453f386833b90b6cede8d2374f0ca67e9d7b14057bf2c991b2530fa43fcc20670734ef9b81157df551e543839b68')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
