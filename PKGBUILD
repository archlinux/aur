# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPseeker
_pkgver=1.32.1
pkgname=r-${_pkgname,,}
pkgver=1.32.1
pkgrel=1
pkgdesc='ChIPseeker for ChIP peak Annotation, Comparison, and Visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-dplyr
  r-enrichplot
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-ggvenndiagram
  r-gplots
  r-gtools
  r-iranges
  r-magrittr
  r-plotrix
  r-rcolorbrewer
  r-rtracklayer
  r-s4vectors
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
optdepends=(
  r-clusterprofiler
  r-ggimage
  r-ggplotify
  r-ggupset
  r-knitr
  r-org.hs.eg.db
  r-reactomepa
  r-rmarkdown
  r-testthat
  r-tibble
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8eadcd66bbe60d17e72240a4f1c7b95a9cf11a7cd97df9833d1831ba39094550')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
