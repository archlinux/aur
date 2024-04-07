# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=poweRlaw
_pkgver=0.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Analysis of Heavy Tailed Distributions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-pracma
)
optdepends=(
  r-covr
  r-knitr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2ca5d7b8050bbda8d70c0258286e2008')
b2sums=('50fabfe1993715e39af8225917428b138308d8ca7dd03f4db22c7767588c981fc6148307574db8d1f9a985f17c6443de5984993864cef80aed6cf76f4e0110e1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
