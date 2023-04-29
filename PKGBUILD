# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PloGO2
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
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
sha256sums=('636fb3b64ac341dfb4b16b4fd08e46a0b1469f9f0a7f3c89ad71013f09f0aae8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
