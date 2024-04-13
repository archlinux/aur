# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trena
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fit transcriptional regulatory networks using gene expression, priors, machine learning"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
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
md5sums=('427f71434aa331a134672ca1746a28ae')
b2sums=('49f6d96f191c2dd8128b4ba88ae4f5db67a5ce8750d8529c8159e379d3022135f81ad437bc66121b3f6a0312bcdc32905ed630af3986ced9ca2d2ee0b276d986')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
