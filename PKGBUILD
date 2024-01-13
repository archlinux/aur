# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metaseqR2
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='An R package for the analysis and result reporting of RNA-Seq data by combining multiple statistical algorithms'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-absseq
  r-bayseq
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
  r-venndiagram
  r-vsn
  r-yaml
  r-zoo
)
optdepends=(
  r-biocmanager
  r-bsgenome
  r-knitr
  r-rmysql
  r-runit
  r-tcc
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c590809d04fdcd8b7f3de13f531cfbc60b2aa47ab697926b1fcfc8683652e9e9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
