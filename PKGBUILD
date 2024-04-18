# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SeqSQC
_pkgver=1.24.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A bioconductor package for sample quality check with next generation sequencing data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-e1071
  r-experimenthub
  r-gdsfmt
  r-genomicranges
  r-ggally
  r-ggplot2
  r-iranges
  r-plotly
  r-rcolorbrewer
  r-reshape2
  r-rmarkdown
  r-s4vectors
  r-snprelate
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b1342a902d724d3ae17b2a6039d5d637')
b2sums=('c2f817f4f7e70e761ee96fb480a858dc63db10a850075c702b416abb00b80c9b33b9de1347099d7e4b184d8ec50f351062ec9e0eafb13ed8fc9d58570a61edab')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
