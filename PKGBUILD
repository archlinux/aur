# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=eegc
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Engineering Evaluation by Gene Categorization (eegc)'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-clusterprofiler
  r-deseq2
  r-dose
  r-edger
  r-ggplot2
  r-gplots
  r-igraph
  r-limma
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-pheatmap
  r-r.utils
  r-s4vectors
  r-sna
  r-wordcloud
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6b61cdb9c22ea4b288adb0aca69b88ecb94591a40d829b4512f37781b5fcc754')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
