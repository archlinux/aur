# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Rvisdiff
_pkgver=1.4.0
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
md5sums=('4ba986d27d98c2d83005b9e6d69c0f32')
b2sums=('d639607c1d76fb529f4788876577dfbb396bc3d12402079a4341a986e6ba9edd611c9655fe8bcd4d23ad87a0f7d3446eae8270b7907fcd0850a7110d9c4991d1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
