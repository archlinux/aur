# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trena
_pkgver=1.22.2
pkgname=r-${_pkgname,,}
pkgver=1.22.2
pkgrel=1
pkgdesc='Fit transcriptional regulatory networks using gene expression, priors, machine learning'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biomart
  r-biostrings
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-dbi
  r-genomicranges
  r-glmnet
  r-lassopv
  r-motifdb
  r-org.hs.eg.db
  r-randomforest
  r-rmysql
  r-rpostgresql
  r-rsqlite
  r-snplocs.hsapiens.dbsnp150.grch38
  r-wgcna
  r-xgboost
)
optdepends=(
  r-biocgenerics
  r-biocparallel
  r-bsgenome.athaliana.tair.tair9
  r-bsgenome.scerevisiae.ucsc.saccer3
  r-formatr
  r-knitr
  r-markdown
  r-plyr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('01f278dd7c60fd72e5d47a43f25555071651ec1eb46888ad656f8ef244c550f6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
