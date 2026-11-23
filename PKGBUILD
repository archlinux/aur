# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=meshes
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='MeSH Enrichment and Semantic analyses'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-enrichit
  r-gosemsim
  r-gson
  r-meshdbi
  r-yulab.utils
)
optdepends=(
  r-knitr
  r-prettydoc
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('128002d49c1f53cca95a6ba13b6ffb0d26fdedd8b864e66315b2269d3b228461')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
