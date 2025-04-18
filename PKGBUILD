# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scp
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mass Spectrometry-Based Single-Cell Proteomics Data Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggplot2
  r-ggrepel
  r-ihw
  r-matrixstats
  r-metapod
  r-mscoreutils
  r-multiassayexperiment
  r-nipals
  r-qfeatures
  r-rcolorbrewer
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocgenerics
  r-vdiffr
  r-biocstyle
  r-impute
  r-knitr
  r-msdatahub
  r-patchwork
  r-preprocesscore
  r-rmarkdown
  r-scater
  r-scpdata
  r-sva
  r-testthat
  r-uwot
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0463655505c24bfb2b38775e64652534')
b2sums=('961b5ab3b5aec75c12f17a948192dbc8a6a040d29430f9f5d1690f9e6c37b841de440876144d089eb9a54b8c77f045b98582d1e3307b6b030b13b63afc69d88d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
