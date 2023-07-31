# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNVRanger
_pkgver=1.16.5
pkgname=r-${_pkgname,,}
pkgver=1.16.5
pkgrel=1
pkgdesc='Summarization and expression/phenotype association of CNV ranges'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-data.table
  r-edger
  r-gdsarray
  r-gdsfmt
  r-genomeinfodb
  r-genomicranges
  r-iranges
  r-limma
  r-plyr
  r-qqman
  r-raggedexperiment
  r-rappdirs
  r-reshape2
  r-s4vectors
  r-snprelate
  r-summarizedexperiment
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-bsgenome.btaurus.ucsc.bostau6.masked
  r-complexheatmap
  r-curatedtcgadata
  r-ensembldb
  r-grid
  r-gviz
  r-knitr
  r-multiassayexperiment
  r-regioner
  r-rmarkdown
  r-tcgautils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9be2f3f77280a5040f32e1ff5aaa70cc2dfb9f7a3c67b0f1db3ee0626d439791')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
