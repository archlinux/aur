# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ecostats
_pkgver=1.2.2
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
md5sums=('375fbd0ede9b607449bf498960efb749')
b2sums=('3cf32b5899f08943beb5cc7069c7a8db06367345c46c09e38b52f52fa3522ba2d0323ddebf5e61790dfd8f6e584cf1a324f863260fb0b729ffb9afa9a5d6aecf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
