# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scp
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mass Spectrometry-Based Single-Cell Proteomics Data Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-dplyr
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
md5sums=('6d0918024a41e466059a694476266f3a')
b2sums=('de9333382576510dad4ffb409842d0d46e43a55b24a86aea6409f9d79a4744d95b21e24d34bed06005c4a5af898a17e44fbd79d4747aac18703dd1ace394877b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
