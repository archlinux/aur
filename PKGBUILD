# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RApiSerialize
_pkgver=0.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R API Serialization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('56ab4c59e8a1433053fc7d318955ea4e')
b2sums=('1bb85ffe507455329c5e038b7c3d87253d394ff5b587028f96c1bc6b6180dfef0daf32c067f1dab8be6e1317f2bbfa887d845792c8d16ee6a2e6c72e1aacc1f2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
