# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=M3Drop
_pkgver=1.28.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Michaelis-Menten Modelling of Dropouts in single-cell RNASeq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-bbmle
  r-gplots
  r-hmisc
  r-irlba
  r-matrixstats
  r-numderiv
  r-rcolorbrewer
  r-reldist
  r-scater
  r-statmod
)
optdepends=(
  r-biobase
  r-knitr
  r-m3dexampledata
  r-rocr
  r-seurat
  r-singlecellexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cffb60b3200abaaad64e2d179376679a')
b2sums=('bb47683ea9057372517bb26ecfe6ab3b40a179ba856be63dbdde7c4bf4f78c144dfa5794b30351d469faa94bafc64b8c99447de7583e529e17069844c5d472f0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
