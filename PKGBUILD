# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DEsubs
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='DEsubs: an R package for flexible identification of differentially expressed subpathways using RNA-seq expression experiments'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-circlize
  r-deseq2
  r-ebseq
  r-edger
  r-ggplot2
  r-graph
  r-igraph
  r-jsonlite
  r-limma
  r-locfit
  r-nbpseq
  r-pheatmap
  r-rbgl
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e560a699048528cfb5f22c159162628e5e6f38008fd21cdbb0142d3282df8d7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
