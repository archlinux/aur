# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rogue
_pkgver=2.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identify Rogue Taxa in Sets of Phylogenetic Trees"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-ape
  r-cli
  r-fastmatch
  r-matrixstats
  r-rdpack
  r-treedist
  r-treetools
)
optdepends=(
  r-knitr
  r-plottools
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f38d56efe1387adf8fedd8c10a629492')
b2sums=('b8bffd62aec380bd128347f4b32f6e9c500592ae6e0543f4ba09c605760d20b136fc0577dd4ec2f1072c46dd1a51877454212d311392c43f8a5b084aa54dbad6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
