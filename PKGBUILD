# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metaseqR2
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for the analysis and result reporting of RNA-Seq data by combining multiple statistical algorithms"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-absseq
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biomart
  r-biostrings
  r-corrplot
  r-deseq2
  r-dss
  r-dt
  r-edaseq
  r-edger
  r-genefilter
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-gplots
  r-harmonicmeanp
  r-heatmaply
  r-htmltools
  r-httr
  r-iranges
  r-jsonlite
  r-limma
  r-locfit
  r-log4r
  r-magrittr
  r-nbpseq
  r-pander
  r-qvalue
  r-rmarkdown
  r-rmdformats
  r-rsamtools
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-seqinfo
  r-stringr
  r-summarizedexperiment
  r-survcomp
  r-txdbmaker
  r-venndiagram
  r-vsn
  r-yaml
  r-zoo
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-bsgenome
  r-knitr
  r-rmysql
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6e903be117a284b322ab266da86efcf7')
b2sums=('46d689c1d8661493e841552406d24fb809afd27b516f518fe505263ecd803e8be4500ebbe86272f290241292b5b0366a7417a47a9c3030ef8cb9c0c12f25bb0d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
