# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=compartmap
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Higher-order chromatin domain inference in single cells from scRNA-seq and scATAC-seq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocsingular
  r-delayedarray
  r-delayedmatrixstats
  r-genomicranges
  r-ggplot2
  r-hdf5array
  r-raggedexperiment
  r-reshape2
  r-rmtstat
  r-rtracklayer
  r-scales
  r-summarizedexperiment
)
optdepends=(
  r-covr
  r-knitr
  r-markdown
  r-rcpp
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('99ff3e58dff338f71c08fae6f058852c')
b2sums=('e3d778fc91211ee0fcb37bd7044a2005e71a5d13214262c9d926cdf22684473e23acd339224a6fc2c09711fc7f2db0552ee1a17246d317316e7e626c832e94e8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
