# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=cfdnakit
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fragmen-length analysis package from high-throughput sequencing of cell-free DNA (cfDNA)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-magrittr
  r-pscbs
  r-qdnaseq
  r-rlang
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-roxygen2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8baae2ee138a3b943736ded682abea1c')
b2sums=('16470721f9df199c8f534b8cf578943e424524ef6161adb49dd619c74b7db2e26ce798b35dfab9978fa3d4e0081b878c734d93dece79e374056e120a6a92f80b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
