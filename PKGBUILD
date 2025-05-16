# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSnbase
_pkgver=2.34.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Base Functions and Classes for Mass Spectrometry and Proteomics"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-affy
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-digest
  r-ggplot2
  r-impute
  r-iranges
  r-maldiquant
  r-mscoreutils
  r-mzid
  r-mzr
  r-pcamethods
  r-plyr
  r-protgenerics
  r-psmatch
  r-rcpp
  r-s4vectors
  r-scales
  r-vsn
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-gplots
  r-gridextra
  r-imputelcmd
  r-knitr
  r-magrittr
  r-microbenchmark
  r-msdata
  r-norm
  r-proloc
  r-prolocdata
  r-pryr
  r-rdisop
  r-rgl
  r-rmarkdown
  r-rols
  r-roxygen2
  r-rpx
  r-shiny
  r-summarizedexperiment
  r-testthat
  r-xml
  r-zoo
  r-magick
  r-spectra
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('badde8ede1996b26acf6f0e9c115c67c')
b2sums=('46788ff6bd2112601300abe2af02ba1306fb4b4257ef91d29ca1bf2a9828c5aba53cbfd45b0f7645a6f964e22a06555397cffc1f862a4d8d4bc879969f33d919')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
