# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=consensusDE
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='RNA-seq analysis using multiple algorithms'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-airway
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-data.table
  r-dendextend
  r-deseq2
  r-edaseq
  r-edger
  r-ensdb.hsapiens.v86
  r-ensembldb
  r-genomicalignments
  r-genomicfeatures
  r-limma
  r-org.hs.eg.db
  r-pcamethods
  r-rcolorbrewer
  r-rsamtools
  r-ruvseq
  r-s4vectors
  r-summarizedexperiment
  r-txdb.dmelanogaster.ucsc.dm3.ensgene
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e4652fb90e8c81e03f02c0b03fc90904c306a365cfa8af641f1265a87f8cc503')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
