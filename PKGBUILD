# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcisTarget
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0f7605c0a9396d116b777b4954011027')
b2sums=('c566bd26dd1a7fbec7628d048d4d5d533c34a893c08eddfdd441ff9cfd57af727d99f31e7993e0e6f6a7cb59bc779e22a7da84cdb7a73cbfe4bc7a00c9b5ba90')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
