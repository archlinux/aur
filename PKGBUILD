# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HGNChelper
_pkgver=0.8.15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identify and Correct Invalid HGNC Human Gene Symbols and MGI Mouse Gene Symbols"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-splitstackshape
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ca00878c677895623099319039684286')
b2sums=('8946541b990367cbcd57130b2c3a871b4268ab3c4fcf673dd22a0b3feb27b2240c9d44969ac5e817d7a1b29279a39d7b16a367f73932c5b3c214937f43ba2753')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
