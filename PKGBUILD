# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=REMP
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Repetitive Element Methylation Prediction'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-caret
  r-doparallel
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-impute
  r-iranges
  r-iterators
  r-kernlab
  r-minfi
  r-org.hs.eg.db
  r-ranger
  r-readr
  r-rtracklayer
  r-s4vectors
  r-settings
  r-summarizedexperiment
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylationepicanno.ilm10b2.hg19
  r-knitr
  r-minfidataepic
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9164c082be8a4cd3b8ab89f1859b4d5e2bf54d1ee4d37be49d6c5e10dbeadea4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
