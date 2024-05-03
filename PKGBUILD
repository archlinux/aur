# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Pigengene
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Infers biological signatures from gene expression data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocstyle
  r-bnlearn
  r-c50
  r-clusterprofiler
  r-dbi
  r-dose
  r-dplyr
  r-gdata
  r-ggplot2
  r-go.db
  r-graph
  r-impute
  r-matrixstats
  r-openxlsx
  r-partykit
  r-pheatmap
  r-preprocesscore
  r-reactomepa
  r-rgraphviz
  r-wgcna
)
optdepends=(
  r-annotationdbi
  r-biomart
  r-energy
  r-knitr
  r-org.hs.eg.db
  r-org.mm.eg.db
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ecaa7b5200cc39eb0d5b5913ee3c90c01d9763803d5d8960d47dbfd1d9b14f22')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
