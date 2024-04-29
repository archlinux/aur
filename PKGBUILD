# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bamlss
_pkgver=1.2-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian Additive Models for Location, Scale, and Shape (and Beyond)"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  blas
  lapack
  r-coda
  r-colorspace
  r-distributions3
  r-formula
  r-mba
  r-mvtnorm
  r-sp
)
optdepends=(
  r-bayesx
  r-bit
  r-ff
  r-fields
  r-gamlss
  r-gamlss.dist
  r-glmnet
  r-glogis
  r-interp
  r-keras
  r-knitr
  r-mapdata
  r-maps
  r-rjags
  r-rmarkdown
  r-scoringrules
  r-sdprior
  r-sf
  r-spatstat
  r-spdep
  r-splines2
  r-statmod
  r-tensorflow
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d77198e736ac540d697df35f854a29c9')
b2sums=('cdc221277ce25bbe7b6e40574bed8ff72e8a2e437401bf738c9a68d292a823609627f6b07eea5c38bcc72f1149e52a53d932593a5a8e187fc565b73940960970')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
