# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gmodels
_pkgver=2.19.1
pkgname=r-${_pkgname,,}
pkgver=2.19.1
pkgrel=1
pkgdesc='Various R Programming Tools for Model Fitting'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-gdata
)
optdepends=(
  r-gplots
  r-gtools
  r-lme4
  r-matrix
  r-nlme
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('bb57b83274dcc6c62eeb0d0b041d81ed19daca927bcd3872c4667ccfe3e9888d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
