# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splitstackshape
_pkgver=1.4.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Stack and Reshape Datasets After Splitting Concatenated Values"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-data.table
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ed807075f73276c1769a51cb3ec3ff28')
b2sums=('615d8812d39ac27c5e7b393d7ed267408e6f3f7d3efc993e0ff92630df9e2ec7013bf3ddebab5c0621a73bcc3915f3d7efd5643c3cb6ed270ad566e468eba415')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
