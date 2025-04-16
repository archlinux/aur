# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Rvisdiff
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive Graphs for Differential Expression"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-edger
)
optdepends=(
  r-airway
  r-biocmanager
  r-biocstyle
  r-deseq2
  r-knitr
  r-limma
  r-matrixtests
  r-rmarkdown
  r-summarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('619f3fdcc6bbbbba93688a2215b190b4')
b2sums=('d681230d3e5b9130f831a2dc3f9e11cb8efa8300a66d1e4562e9b6f4a5b779c6085d2dd52833711607c40ce9a65059d47bae7bce022a1cef2a08da989836d504')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
