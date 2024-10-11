# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bamlss
_pkgver=1.2-5
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
md5sums=('18a23a244332b03d4e519d0bd356335f')
b2sums=('b2cd69b69a6cbfdaddcaf742d631991e78ce85c6f891ca6df6eae6a28bd955127cabd57fdc3bb6fab99328ffbf3cab4c18ff9225fdd64184e23879b8286f1fe0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
