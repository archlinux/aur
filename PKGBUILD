# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ORIClust
_pkgver=1.0-1
pkgname=r-${_pkgname,,}
pkgver=1.0.1
pkgrel=4
pkgdesc='Order-restricted Information Criterion-based Clustering Algorithm'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('78705097c580adcd4d69f526293040cb4d0668b736121eced35f68ea5b6b2dae')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
