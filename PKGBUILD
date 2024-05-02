# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstats
_pkgver=4.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Protein Significance Analysis in DDA, SRM and DIA for Label-free or Label-based Proteomics Experiments"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  blas
  r-checkmate
  r-data.table
  r-ggplot2
  r-ggrepel
  r-gplots
  r-htmltools
  r-limma
  r-lme4
  r-marray
  r-msstatsconvert
  r-plotly
  r-preprocesscore
  r-rcpp
  r-statmod
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-markdown
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7901abc9eece39cdf9b158ca521d7452')
b2sums=('2d655ac8d0440ffff57306dee7d7b2def3c66f9572fc95f8a6e811fa945d4aa4347e7efeb1235dc6133188a18af134d2d49ca6fbd0503867934ea83cebc42009')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
