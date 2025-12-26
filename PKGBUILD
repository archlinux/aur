# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sangerseqR
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Sanger Sequencing Data in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biostrings
  r-pwalign
  r-shiny
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3d441a924043980d2d7f04a70ba8c359')
b2sums=('223b86a1f6770fbc351eed2c118ed214f180ae91ba5912568a151b8a5d36327e36cefe4759bfcb5484d385c47771668e60a18edd26059d8db99ddf0378ee281c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
