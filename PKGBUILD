# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOsubmission
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
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
sha256sums=('d7ed504ad75972adc0e24ba7dc039a0824fc1607a71dc7d7b279b0e549ea5eac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
