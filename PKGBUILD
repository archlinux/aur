# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ClusterJudge
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Judging Quality of Clustering Methods using Mutual Information'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-httr
  r-infotheo
  r-jsonlite
  r-latticeextra
)
optdepends=(
  r-biomart
  r-devtools
  r-knitr
  r-rmarkdown
  r-testthat
  r-yeastexpdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5052a296decece6b9a23134ea0e85d9f8ad9560389348d011a505c8f05ba8494')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
