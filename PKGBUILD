# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=bssm
_pkgver=2.0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian Inference of Non-Linear and Non-Gaussian State Space Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  pandoc
  r-bayesplot
  r-checkmate
  r-coda
  r-diagis
  r-dplyr
  r-posterior
  r-rcpp
  r-rlang
  r-tidyr
)
makedepends=(
  r-ramcmc
  r-rcpparmadillo
  r-sitmo
)
optdepends=(
  r-covr
  r-ggplot2
  r-kfas
  r-knitr
  r-ramcmc
  r-rmarkdown
  r-sde
  r-sitmo
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('35c8d50ac5ee61f9a4f6802eba49c41e')
b2sums=('261e1faf933b1d6b7852b682d470dff678515f77dab064915fab39bbc5909f75aad6afe0c0e02523885788ba7ba365d44f9de478e7912b8397b111b7e5ef7f16')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
