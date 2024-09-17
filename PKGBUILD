# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=bssm
_pkgver=2.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('a1235d8be6cfbf742b99a6340863e8c6')
b2sums=('287273fa35b10ec6554a599c8691b625b6ce9c11fcee9305cae5bd203441f55c6e57bf8257d9d8c31a933c61ceb6f6f5aebb901ab0943e585ca258ee5c59b4fd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
