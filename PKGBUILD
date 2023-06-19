# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNVRanger
_pkgver=1.16.4
pkgname=r-${_pkgname,,}
pkgver=1.16.4
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
sha256sums=('2337f4a93729c9d941889a4147defbf755926ac247d8ad28da7c7436a6a64a6f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
