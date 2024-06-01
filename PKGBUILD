# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcisTarget
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RcisTarget Identify transcription factor binding motifs enriched on a list of genes or genomic regions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-arrow
  r-aucell
  r-biocgenerics
  r-data.table
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-gseabase
  r-r.utils
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-zoo
)
optdepends=(
  r-biobase
  r-biocparallel
  r-biocstyle
  r-doparallel
  r-dt
  r-foreach
  r-gplots
  r-igraph
  r-knitr
  r-rcistarget.hg19.motifdbs.cisbponly.500bp
  r-rmarkdown
  r-rtracklayer
  r-testthat
  r-visnetwork
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ecda55e75c23883bdea365e8a72606fa')
b2sums=('061b3c9b122be014e9856762d5f1006fe8cc026cd5af7f73933528d99f987913379d6478fe5db07d8c7190a83ed26e6fa0334884ffb29bfcf3ccd9df18309321')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
