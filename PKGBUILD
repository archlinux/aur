# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scp
_pkgver=1.22.0
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
md5sums=('43d20e51ba11af852b9e94cf15d5f7b5')
b2sums=('e0d432b4ff48227639e80119916d4d236e5ab9e40d8f97e2b02da1ece232b7082b2e4b68926081f96880d79038e080d0326924f5f31ad8366dac1b2395300807')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
