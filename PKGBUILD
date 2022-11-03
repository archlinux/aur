# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sesameData
_pkgver=1.15.2
pkgname=r-${_pkgname,,}
pkgver=1.15.2
pkgrel=1
pkgdesc='Supporting Data for SeSAMe Package'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationhub
  r-curl
  r-experimenthub
  r-rmarkdown
  r-genomicranges
  r-readr
)
optdepends=(
  r-biocgenerics
  r-genomicranges
  r-knitr
  r-sesame
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b8c97c565e1ec1365ce6e720f67b8bb2030b97ba35fc49fe29c987211e5ecf3d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
