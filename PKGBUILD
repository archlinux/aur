# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MultimodalExperiment
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Integrative Bulk and Single-Cell Experiment Container"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-iranges
  r-multiassayexperiment
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('376186ba5972df1b6d4be9dc69253a61')
b2sums=('f580d39fd7453a823eab37419caf8690048170a5e611c32f0d5744f55e4732c876519cd67bd36c6f34921356d41895bdc2e8494d4e65b4c11135f9276ff44701')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
