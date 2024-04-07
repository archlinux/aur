# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qdapRegex
_pkgver=0.7.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('c5c21c986834e64e87a44891614f0196')
b2sums=('5d27e98be30591e4b7086e08485d13e2b931aed8b40c0083ec8674f92e5695ea88fcdf7e65b31f02d375d4379d1869cd226f11760ad52a6948b7be0acdfe7c80')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
