# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccaPP
_pkgver=0.3.3
pkgname=r-${_pkgname,,}
pkgver=0.3.3
pkgrel=4
pkgdesc='(Robust) Canonical Correlation Analysis via Projection Pursuit'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-pcapp
  r-rcpp
  r-rcpparmadillo
  r-robustbase
)
optdepends=(
  r-knitr
  r-mvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('134246c12bec9b7da5be2a46ec6baec9098e91d233c23f1d9ca0a463607c08dc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
