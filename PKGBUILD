# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SiPSiC
_pkgver=1.4.0
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
md5sums=('53922a73cd58dbb930520a7980948062')
b2sums=('cbd32ad27f8869c3321fbed780c3ae2427348ac91bffdc651bd224ff1b442c95e5f11bf97801156039b13a3574f277e14b3d5ef373082735b48006d2aa06ed1f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
