# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=imputeLCMD
_pkgver=2.1
pkgname=r-${_pkgname,,}
pkgver=2.1
pkgrel=1
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
sha256sums=('361caf4c57ea3f6b08d00a6e4512a439bfea5d49d72c545cfa115e7256b2dc70')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
