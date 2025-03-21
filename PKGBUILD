# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lefser
_pkgver=1.16.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R implementation of the LEfSE method for microbiome biomarker discovery"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-coin
  r-dplyr
  r-ggplot2
  r-s4vectors
  r-summarizedexperiment
  r-ggtree
  r-stringr
  r-testthat
  r-forcats
  r-tibble
  r-tidyr
)

optdepends=(
  r-biocstyle
  r-covr
  r-curatedmetagenomicdata
  r-knitr
  r-phyloseq
  r-pkgdown
  r-rmarkdown
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fc3c02d3a9ce8e920d41310da7913faa')
b2sums=('17be5912fc257b7a18f8b872dd7fd6511afbd2142a726977dbda534ec147a5b461b1a5053b9cb9c16fc2adc13da67f458564aec36eff35a02ec5d3e0e9de74e7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
