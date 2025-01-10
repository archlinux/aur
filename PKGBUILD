# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stringdist
_pkgver=0.9.15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Approximate String Matching, Fuzzy Text Search, and String Distance Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('70a290bae5be6d7a64e55464eceb3cec')
b2sums=('751b4d8a482d2aef7ac0a92778c85ac6873c83854ebd9fd8c9d5b74b20a53af5a00de067b8483bc9391c0690f10485fdecf75c01c17601b87e883e3f36bdea02')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
