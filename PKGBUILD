# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trena
_pkgver=1.22.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
  r-limma
  r-markdown
  r-plyr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ee87f22b3b43424a5b517596008b90a0')
b2sums=('9a778c864b78b34a3945af7b6dfd8c6ad5bf4782bf8586b5e8fc1d636748093083b20e7ad514c35bd0133fb705a401c466a93d2ad01f14238a7aff9ef9248585')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
