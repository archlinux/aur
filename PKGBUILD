# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nullrangesData
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ExperimentHub datasets for the nullranges package"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-experimenthub
  r-genomicranges
  r-interactionset
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c8b4cf63d70a2577251c03c093c014b1')
sha256sums=('be0351222a6dfd2323080550e88af5552fc0e0f3d6d7123919764cf10f68a935')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
