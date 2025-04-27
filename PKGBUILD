# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DegNorm
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="degradation normalization for RNA-seq data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-or-later')
depends=(
  blas
  r-data.table
  r-doparallel
  r-foreach
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-heatmaply
  r-iranges
  r-plotly
  r-plyr
  r-rcpp
  r-rsamtools
  r-s4vectors
  r-txdbmaker
  r-viridis
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-formatr
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('853c426db7b1747300d0c1db4a751b3c')
b2sums=('f1f84608250216de6e8d8fc0ae487c10e529ce79b6a7fe9315903df7e2e5e782ebcd1d809d2243764c35f8061c22487c44b0ccb1b8735b6c62b88c1ea13a02f5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
