# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=INSPEcT
_pkgver=1.32.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Modeling RNA synthesis, processing and degradation with RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-deseq2
  r-desolve
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-plgem
  r-proc
  r-readxl
  r-rootsolve
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shiny
  r-summarizedexperiment
  r-txdb.mmusculus.ucsc.mm9.knowngene
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d6ed794228c1ef9d64e7ae97278d7ccf')
b2sums=('29c60d50f1ce663d7b7019bd8d58c6867b1339a1865a9af773e84087b21ffde4bcdfbee2880bbb10f22b801e9aa60a788e4e2a2c4757f2774edc55f7954c7974')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
