# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=deco
_pkgver=1.13.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Decomposing Heterogeneous Cohorts using Omic Data Profiling"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-ade4
  r-annotationdbi
  r-biobase
  r-biocparallel
  r-biocstyle
  r-gdata
  r-ggplot2
  r-gplots
  r-gridextra
  r-limma
  r-locfit
  r-made4
  r-rcolorbrewer
  r-reshape2
  r-scatterplot3d
  r-sfsmisc
  r-summarizedexperiment
)
optdepends=(
  r-curatedtcgadata
  r-homo.sapiens
  r-knitr
  r-multiassayexperiment
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2a6fcb887712cc6591e2800ed5b6f953')
b2sums=('ff6427893e0be97660c3a729c18786fada53c61405cf23b3a37659287effaefafed2d4f35fbe87df6e43f689334568ea77051f8621cd45319d43cd7a9d0e0066')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
