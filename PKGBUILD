# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOmetadb
_pkgver=1.68.1
pkgname=r-${_pkgname,,}
pkgver=1.68.1
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
  r-dbplyr
  r-dplyr
  r-knitr
  r-rmarkdown
  r-tm
  r-wordcloud
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('88426fce62d7c09f9eb97e1a4be63a09e46ea4a8cb34190106af782ac352099f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
