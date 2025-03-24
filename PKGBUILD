# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qdapRegex
_pkgver=0.7.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Regular Expression Removal, Extraction, and Replacement Tools"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-stringi
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b65f80ddea5a108c2327f378a09fa47')
b2sums=('d4d3f479654f4c093413dd1526a1658538c41969084f7ee2cefd20e9adda4a090dc798a79cdcd071041542944d65b70ed2b81fe336a55c26a47067bf4bab6405')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
