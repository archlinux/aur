# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bamlss
_pkgver=1.1-9
pkgname=r-${_pkgname,,}
pkgver=1.1.9
pkgrel=3
pkgdesc='Bayesian Additive Models for Location, Scale, and Shape (and Beyond)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-coda
  r-colorspace
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
  r-maptools
  r-mass
  r-nnet
  r-rjags
  r-rmarkdown
  r-scoringrules
  r-sdprior
  r-spatstat
  r-spdep
  r-splines2
  r-statmod
  r-tensorflow
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0c25ebeef5b27f4b32a449b80158c87a954b51e2ca8429112bb929049a7c8cfe')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
