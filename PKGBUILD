# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=M3Drop
_pkgver=1.40.0
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
md5sums=('de766f5625c0d77ced30cfa5c9e67894')
b2sums=('901d7b7339cf24a39a2b960ba3b1b5b23d63b716e9828fb3d79a9ec6952d59b14544d17d996a9ba13138a8265a7c2ccd1cc00ba028cf1ba09b2b4a050a49f323')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
