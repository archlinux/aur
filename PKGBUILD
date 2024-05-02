# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Rvisdiff
_pkgver=1.2.0
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
md5sums=('00a5acc3c51f00f5ce82f5d70dd3c21b')
b2sums=('89701b9a38e3f2f6b11741ed78d573c2bfc143265bbb3e42b0a094db8960a87eaa03a80450c7a75ebfc1e9b986c8e9e44a4ee2b9f4efddc8951f1fe41d2a6029')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
