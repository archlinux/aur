# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SiPSiC
_pkgver=1.12.0
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
md5sums=('6fcc24b849c28f45eebad9d1d539b2b1')
b2sums=('51fa75eb09cb33e58ad80caf64ea2f92b2ae5aa8cf9d80590772c8c3d361c6a275f0f71eab609c8dea801bb6b618a36b9815ab6500046adf13313f2252c2ca73')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
