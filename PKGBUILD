# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=MSstatsResponse
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
  r-tidyr
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
md5sums=('013f4b8ac573e4712b84ec3b4ee8076e')
b2sums=('d4028afec4c587a77036d1224f9721ce4883f1c900d81697244cd1dced96b8c4471cf68a4d89e1b4e2ecf366d02c7c1291ec18dcffdc3e8833c28cc6e27d20c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
