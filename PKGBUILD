# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SMITE
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='Significance-based Modules Integrating the Transcriptome and Epigenome'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biobase
  r-bionet
  r-genelendatabase
  r-genomicranges
  r-ggplot2
  r-goseq
  r-hmisc
  r-igraph
  r-iranges
  r-keggrest
  r-org.hs.eg.db
  r-plyr
  r-reactome.db
  r-s4vectors
  r-scales
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ce0bd53f72b7d6139d9f3f47b12708f0a8be9a96a4634989708ef60a6b079b87')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
