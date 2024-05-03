# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=meshes
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='MeSH Enrichment and Semantic analyses'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-dose
  r-enrichplot
  r-gosemsim
  r-meshdbi
  r-yulab.utils
)
optdepends=(
  r-knitr
  r-prettydoc
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('263e34a394a9a85a0a57299e5d7d76e0dba038b1b0809ba4565dad7c7a6e8179')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
