# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MOFAdata
_pkgver=1.25.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data package for Multi-Omics Factor Analysis (MOFA)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-multiassayexperiment
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7723bb4b2f28f49cc564acfdc42828ce')
b2sums=('65025b740d00e3c92fde4a1add96fe0af4ba53f5e43e8f4e5b330c49e6a686defc99bc5b4980def4fdaccac2f2490cebf2d30410411cf0a4711ece2f6409359f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
