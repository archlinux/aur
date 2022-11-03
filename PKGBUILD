# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trena
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
  r-vbsr
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
sha256sums=('566c27500e8c39009208c8a817ab9948c00da9150ad76f3ccaef39718b405530')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
