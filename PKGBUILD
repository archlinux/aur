# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstats
_pkgver=4.16.1
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
md5sums=('966af9665c43bbf74e19f98f1aa1755d')
b2sums=('968c1eb6f09a9895a5f3dab91896ba5f3105a29799faec2c9af5bd5a3d7a678b326d1253e76ad721bda7ffdb7ffd1213f0c82e3672747a28f12904a937eacd3a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
