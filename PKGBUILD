# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PloGO2
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='Plot Gene Ontology and KEGG pathway Annotation and Abundance'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-go.db
  r-gostats
  r-httr
  r-openxlsx
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('baa0e01b069d5e66965a156bee6d3f6adf8cb0957f3cb9b0442dfbd0458d9fbb')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
