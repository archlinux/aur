# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ClusterJudge
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
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
sha256sums=('03c0925dc1eb0e1bbba0e9e80b5fd81697963b1991f2ced969296679c80b5604')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
