# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOmetadb
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=1.62.0
pkgrel=1
pkgdesc='A compilation of metadata from NCBI GEO'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-geoquery
  r-rsqlite
)
optdepends=(
  r-dplyr
  r-knitr
  r-rmarkdown
  r-tm
  r-wordcloud
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1890d8731e265c667be6e25eebac68efb7b2a65d879265bc46910b2b9c0f9576')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
