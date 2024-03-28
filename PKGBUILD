# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TVTB
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The VCF Tool Box"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationfilter
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-ensembldb
  r-ensemblvep
  r-genomeinfodb
  r-genomicranges
  r-ggally
  r-ggplot2
  r-gviz
  r-iranges
  r-limma
  r-reshape2
  r-rsamtools
  r-s4vectors
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-covr
  r-dt
  r-ensdb.hsapiens.v75
  r-knitr
  r-pander
  r-rmarkdown
  r-rtracklayer
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('64da00f3c21bf3f9a82dc32e451395a1')
b2sums=('e9383fe58a3af14f9b76c2bb759e07a9ba4181daeeea7f2141744be3991226adedd33e067784adf942749ab025d40432bdd02d16674d1535bdb1fc0618c3a13d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
