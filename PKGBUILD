# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KEGGREST
_pkgver=1.36.2
pkgname=r-${_pkgname,,}
pkgver=1.36.2
pkgrel=1
pkgdesc='Client-side REST access to the Kyoto Encyclopedia of Genes and Genomes (KEGG)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biostrings
  r-httr
  r-png
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-markdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('fc7d4fcad2a08d5b8a7d4cc620a5ad3e2a588e406e4fa8fe5ef902e4111fc0e6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
