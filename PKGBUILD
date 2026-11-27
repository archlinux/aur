# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bamlss
_pkgver=1.2-6
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
  r-sf
  r-spatstat
  r-spdep
  r-splines2
  r-statmod
  r-tensorflow
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('269e3d58c2bc0a2593a4b6376b23af6e')
b2sums=('086ab6f0186a1fec7b349d68fb3738293b168d0828e1ed81c9c8f9433426419fe68cdcfcd697e1ced4ba478d65fc421a89f8637258b9026a721fda795bcca135')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
