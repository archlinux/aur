# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=INSPEcT
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-seqinfo
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
md5sums=('34f40da4fee2563ed3cb5e696bbc3063')
b2sums=('ff71748ebf1afd9283846721547aa82bdb2a7d4e8b57c05f2d0f9dba9dc02fca340ece94fa082596962499a477cd68662f1e43f820f69f6038307f8dd70c4b12')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
