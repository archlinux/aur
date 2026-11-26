# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Rvisdiff
_pkgver=1.12.0
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
md5sums=('c4894bf31e64d8e6b9104bed4d95eddc')
b2sums=('8cb20837781618219396de916afb122e41b053e08bb8977a2d336276d037a25e7e134545a4853991a5de5794fd8f6c4e1cdb7a4d2dbbe697e034b18c47ff9fa7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
