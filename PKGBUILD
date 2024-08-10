# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SiPSiC
_pkgver=1.4.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Calculate Pathway Scores for Each Cell in scRNA-Seq Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-singlecellexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c64c99d9027388c769b06f8ac6067786')
b2sums=('c164289bbc1e4bcc08dc0a9bc219f72b05df0a3e7cf3a8e22b72eb0cd639f424a6ffcc5dc7868830e96dae30047a73fe9783f1ffb369cadbcc02b7ba4288603a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
