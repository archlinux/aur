# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=infotheo
_pkgver=1.2.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Information-Theoretic Measures"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('980ad0bc179733e870c25276cc95680e')
b2sums=('29605dd98d54deccf85ca2c2edd181042f4c83253973925a80b620742a96ed7b4b092f0aa56cb65eb8d38d10674d9f0a3891b2b925f7fe0f99ff1e3aa7649708')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
