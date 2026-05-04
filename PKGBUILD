# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=EBMAforecast
_pkgver=1.0.33
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('99db73ead6d8e2bceeb4ccbac10b13d8')
b2sums=('1b6262bc892ae261a15aa692ed12eff5d8a504d0a5a0012ae3138c590227fa9def440573e92f2bc35ce41c208a3a9db7a92b500e59a6e68c355a253c524ddddf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
