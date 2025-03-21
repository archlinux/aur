# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstats
_pkgver=4.14.2
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
  r-mockery
  r-kableextra
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f6eacc4ec087edae8c13a00325f840b1')
b2sums=('faa2c816700ec60f4e9c2495baea35b3d83c7a94bea3f1ba14483abdaa6c8be990a8aa2b9e58a5df7cfe5e87a31edc86956a61ec764f71f0ddc2efd25d59ab11')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
