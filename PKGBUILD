# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocHail
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="basilisk and hail"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-basilisk
  r-biocfilecache
  r-biocgenerics
  r-dplyr
  r-reticulate
)
optdepends=(
  r-biocstyle
  r-dt
  r-ggplot2
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('94e7a91285e0640da2c813ff3f96f1af')
b2sums=('8dec20307934f1c6d7a2c70d0e9f0f08c6f4484adc20b33532c79b64db94a6a9bc11fa283eab919d8ad6b2592228d06c1aed2c1a92ee75110e4bd98ea0ef2794')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
