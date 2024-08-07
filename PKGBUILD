# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ecostats
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Code and Data Accompanying the Eco-Stats Text (Warton 2022)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.1-or-later')
depends=(
  r-ecocopula
  r-get
  r-mvabund
  r-mvtnorm
)
optdepends=(
  r-ade4
  r-caper
  r-car
  r-corrplot
  r-covr
  r-daag
  r-dharma
  r-dplyr
  r-gclus
  r-ggally
  r-ggplot2
  r-ggthemes
  r-gllvm
  r-glmmtmb
  r-glmnet
  r-gparotation
  r-grplasso
  r-knitr
  r-leaps
  r-lme4
  r-mcmcglmm
  r-multcomp
  r-ordinal
  r-permute
  r-pgirmess
  r-phylobase
  r-phylosignal
  r-psych
  r-reshape2
  r-rmarkdown
  r-smatr
  r-testthat
  r-vegan
  r-vgam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('89bd47d789ac907fe69fde7ccf302514')
b2sums=('f9554835788c9ede1650727e5d67ae4103ec87d2667ad58c5c855b20240d42a5fc704210b861f3d0d70f3eab523b9d3409763f669bf060647123a86f6f78a344')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
