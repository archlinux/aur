# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metaseqR2
_pkgver=1.16.0
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
md5sums=('a406f8ff6d42c145b6b2bc0982d9faa4')
b2sums=('1967c3caf3b366a9ec9f26a7e154a8313b7d809e6784179df3d9d230c15dadd3f1012873f3b7c49a20b11e4f11fa9a1be30f6aa12343bcb73aa5e36e18fc743f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
