# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=M3Drop
_pkgver=1.38.0
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
md5sums=('06baea82c699c43b4a1ba6c3d5b42662')
b2sums=('42a96503e2dff3d4d5fc49dc56b81b6cd5ef57ec3e53ddee2babf3121dbe6af6b914550e1ce90c03b54de67f6852333522f1582b4b2c601d338047b39daa81a7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
