# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstats
_pkgver=4.12.1
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
md5sums=('fbe700c866603b1cc838da249c6aa835')
b2sums=('d51df0dd69aa47074e6ec912c6b98f8cb53ea8a80e84518c27c850ffc796ce44b3b0daaec3b8ce2b4b8af4f423edaad559f3abd0f631ae0e89a130ecb1d53f56')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
