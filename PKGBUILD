# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PloGO2
_pkgver=1.8.2
pkgname=r-${_pkgname,,}
pkgver=1.8.2
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
sha256sums=('dea62e74ec74eff3ebf33bd1c4d9290b67b0110a2ee0fd0f92ad4d4e60a48e45')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
