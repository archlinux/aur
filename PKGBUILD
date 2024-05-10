# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lefser
_pkgver=1.14.0
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
)
optdepends=(
  r-biocstyle
  r-covr
  r-curatedmetagenomicdata
  r-knitr
  r-phyloseq
  r-pkgdown
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f092ce758deedacc39855a98cfc06849')
b2sums=('404f6a5b4eaf7b74020ca95e47d31e6aa2a783aa9d14a1b4ea95e8e41e65174a092febad84fbe79c23a1b4b1e69b53e01625c13d16103f007545d442b31472ec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
