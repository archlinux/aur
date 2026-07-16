# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNVRanger
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
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
  r-org.hs.eg.db
  r-regioner
  r-rmarkdown
  r-statmod
  r-tcgautils
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('79651c2c4dc1d688b9dafe037b5d23f740531e5e5ac1ed52892832ae6723c806')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
