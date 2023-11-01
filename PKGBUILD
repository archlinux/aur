# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ChIPseeker
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='ChIPseeker for ChIP peak Annotation, Comparison, and Visualization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-aplot
  r-biocgenerics
  r-dplyr
  r-enrichplot
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gplots
  r-gtools
  r-iranges
  r-magrittr
  r-plotrix
  r-rtracklayer
  r-s4vectors
  r-tibble
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-yulab.utils
)
optdepends=(
  r-clusterprofiler
  r-ggimage
  r-ggplotify
  r-ggupset
  r-ggvenndiagram
  r-knitr
  r-org.hs.eg.db
  r-prettydoc
  r-reactomepa
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a0d4710fccda620b750f933916acac6d12999a077e1c17632d8823848a2fa82f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
