# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sylly
_pkgver=0.1-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Hyphenation and Syllable Counting for Text Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sylly.de
  r-sylly.en
  r-sylly.es
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('be7fea02c7ffe52d24a075cea5ecead2')
b2sums=('cb3518f02620351c10b041e99e8ff4cd1d268bfd63a0010e95afb517b3bcf09a4ed6e13e7925cf4b6d32a847961c5c2d866e4116d7ef3f6fc7d98566a109f3ef')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
