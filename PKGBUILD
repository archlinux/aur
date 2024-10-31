# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RbcBook1
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Support for Springer monograph on Bioconductor"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-graph
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7753fb21d64b213fbae45060fb88b2bc')
b2sums=('04a2dd993f7d0bec745c9da0af26e78667fd6fe93ee3ced20d4a66eee00132017eddcbdcd2afd1b666efc104544c36fa237db12d8842762d303ef162584b5a0e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
