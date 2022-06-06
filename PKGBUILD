# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gmodels
_pkgver=2.18.1.1
pkgname=r-${_pkgname,,}
pkgver=2.18.1.1
pkgrel=3
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
sha256sums=('da7d48021b7cd2fd8a7cd8d0bb9658b12342a32698a13877b25ca94aa03f1e95')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
