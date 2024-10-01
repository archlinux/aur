# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=noisyr
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Noise Quantification in High Throughput Sequencing Output"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-doparallel
  r-dplyr
  r-foreach
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magrittr
  r-philentropy
  r-preprocesscore
  r-rsamtools
  r-tibble
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('970c060f9754927acdbb2af41ac01dea')
b2sums=('31b1f41944205c6b2e64734196d804d221ac1dbdee0a7a38f362562e30a2000a24db7b0efb9adfe6c61a11f365569e70f9a1af77decddac53b808c9149370c48')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
