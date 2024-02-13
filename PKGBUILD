# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=metagene
_pkgver=2.31.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A package to produce metagene plots"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-data.table
  r-ensdb.hsapiens.v86
  r-ensembldb
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gplots
  r-iranges
  r-magrittr
  r-matrixstats
  r-purrr
  r-r6
  r-rsamtools
  r-rtracklayer
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
  r-similarpeak
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4709f553e306643ec3d37860f4092ddc')
b2sums=('eea5068082af2b3e785b155c257df1638c3599ddfea17fbb09b59aa995dfbddfa7c801a9f14fad5732d8d927a50ce4747217249c7b939c081c6ada4959f5e2d2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
