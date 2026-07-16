# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dagLogo
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=1.50.0
pkgrel=1
pkgdesc='dagLogo: a Bioconductor package for visualizing conserved amino acid sequence pattern in groups based on probability theory'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-biomart
  r-biostrings
  r-httr
  r-motifstack
  r-pheatmap
  r-uniprot.ws
)
optdepends=(
  r-biocstyle
  r-grimport
  r-grimport2
  r-knitr
  r-rmarkdown
  r-testthat
  r-xml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4471ba9c76090180862be297f96f2e336675d597666b8ffbcf05d2ed5715dfe1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
