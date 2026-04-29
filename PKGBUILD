# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRBaseConverter
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A comprehensive and high-efficiency tool for converting and retrieving the information of miRNAs in different miRBase versions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d836565b66ab33942a47e31a33887b80')
b2sums=('29fdbc3ba922514fd1420bb1e65cb75219c128cd1303d616a0f588bac49609765fec9fce92bae7776a14c64e1b0ec12604869b91e9cb0790eba8890f948a5554')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
