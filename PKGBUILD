# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=INSPEcT
_pkgver=1.34.0
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
md5sums=('8434b90d26b3015b5ffc56f47d60dc75')
b2sums=('497e39d14a12b97ec7a94b7d781d42c0840c42a09c1e9e06d6eab68bb1304d5382d5116f89bdbfcc01ac8af9b35d08130ae2177a80b2e71a4bafbdf4119ef3ad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
