# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=MSstatsResponse
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Methods for Chemoproteomics Dose-Response Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-data.table
  r-dplyr
  r-ggplot2
  r-plotly
  r-stringr
)
optdepends=(
  r-biocstyle
  r-gridextra
  r-knitr
  r-msstats
  r-msstatstmt
  r-purrr
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea8306bd88c4b3ccfda3a1c0d00bbca0')
b2sums=('94760743a0e6452371695faba60f7c257b6fb6167f354fe5391b0ed8b53a56de9d4385ce3bff311f7a2bf2dc63ae94a200794b75e2684dc55e3a3cf469bed9fa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
