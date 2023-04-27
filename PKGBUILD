# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOsubmission
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=1.52.0
pkgrel=1
pkgdesc='Prepares microarray data for submission to GEO'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-affy
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('49992c006d6412f060979dd098ecf0fc36c3341e47f40b492e42bf064263585d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
