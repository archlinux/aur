# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSstats
_pkgver=4.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Protein Significance Analysis in DDA, SRM and DIA for Label-free or Label-based Proteomics Experiments"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-checkmate
  r-data.table
  r-ggplot2
  r-ggrepel
  r-gplots
  r-htmltools
  r-limma
  r-lme4
  r-marray
  r-matter
  r-msstatsconvert
  r-plotly
  r-preprocesscore
  r-rcpp
  r-rhpcblasctl
  r-rlang
  r-statmod
  blas
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-biocstyle
  r-covr
  r-kableextra
  r-knitr
  r-markdown
  r-mockery
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6324a7161a62bbafa1920c7686d3ff8d')
b2sums=('b7fda8f9f079e72a28d92e9ab5f9ee767216011eaa04a4117f67e69f82816a103611246ef740dd5b93b6d6aa3b73a9af30ec2c44f1f93eb240c987774605ae6a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
