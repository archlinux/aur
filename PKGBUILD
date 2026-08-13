# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DegNorm
_pkgver=1.22.0
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
md5sums=('eef998e06eb573e4cf202ed3d43164f3')
b2sums=('66968d1177d51b9a3049a8cdd14e59a4349b6516af6b1f32e6d84cf84e1b7ba57134a932066ef0ffeecbe2c722b021fc34e83111d6bd2b22cfa1409144d83f74')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
