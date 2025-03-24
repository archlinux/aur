# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scp
_pkgver=1.16.0
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
md5sums=('0216fe89610f6d2a2430695639439fd7')
b2sums=('4ce6a5dd89acb837586f93d2c8fca9cde21fbe027bc79a31d0d3b62a07a3afa7740aade475ee4ed9d79c3b2c94965c2ad894911c018a575e5e60841e6638a02f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
