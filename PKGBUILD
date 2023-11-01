# system requirements: pandoc (>= 1.12.3)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RCAS
_pkgver=1.28.2
pkgname=r-${_pkgname,,}
pkgver=1.28.2
pkgrel=1
pkgdesc='RNA Centric Annotation System'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-cowplot
  r-data.table
  r-dt
  r-genomation
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggseqlogo
  r-gprofiler2
  r-iranges
  r-knitr
  r-pbapply
  r-pheatmap
  r-plotly
  r-plotrix
  r-proxy
  r-ranger
  r-rmarkdown
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  pandoc
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('db629b5c513b5f50a34327b67cb722167a88961e8738f100271bbd31996e34a6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
