# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=imputeLCMD
_pkgver=2.0
pkgname=r-${_pkgname,,}
pkgver=2.0
pkgrel=4
pkgdesc='A collection of methods for left-censored missing data imputation'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-impute
  r-norm
  r-pcamethods
  r-tmvtnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dfd5846cb9b6662dff8bfb0e18bc68f1b59f706666209f8dd6b61a1ec38e6383')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
