# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=atena
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis of Transposable Elements"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biocgenerics
  r-biocparallel
  r-cli
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-matrixgenerics
  r-matrixstats
  r-rsamtools
  r-s4vectors
  r-seqinfo
  r-sparsematrixstats
  r-squarem
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-rcolorbrewer
  r-rmarkdown
  r-runit
  r-txdb.dmelanogaster.ucsc.dm6.ensgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e7e4f7e7121c441408dc929c0b255340')
b2sums=('0ebbec3245d5cca6940e502c7b056e2d582f190b856d875eedb626e3c322254ad7c9733b08628133273ed27b49cdc74079f8cbab1d34f906dc426590628a952d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
