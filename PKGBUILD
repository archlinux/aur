# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSnbase
_pkgver=2.30.1
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
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6f84eff4794ce43c0937ee519c151c2d')
b2sums=('71d8c4f0cfebcfc8443762d9346a9762307e5e626db60b79c68c993163aea78c4d4ab00b7868a38452e4ae46ef0814801d2f31c0118ca8a2b251fb2d3bc62e13')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
