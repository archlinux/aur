# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcisTarget
_pkgver=1.28.1
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
md5sums=('d55e855ba3ba141df24368bd5396fd20')
b2sums=('b7d8a30609b2f81686c679e023935e3b482a6e2a7fe6ae06dad204a6fc23517c9ccdd4fb2b4cc56f964a9c63470460b62413f1d32d3e718000ab04aae0b881a7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
