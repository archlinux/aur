# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSnbase
_pkgver=2.32.0
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c9ddc0c7d42dbfa22cff5683a41a27de')
b2sums=('f48e9031b7c23566e1b147e285e88fd7a78e512989020a95e01ab0458c632f0c2f989bf4c0ed339db56d06e7b679da814826eabdb8e0a2db54996bfd6c18d31f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
