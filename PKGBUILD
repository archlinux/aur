# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GWASExactHW
_pkgver=1.01
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Exact Hardy-Weinburg testing for Genome Wide Association Studies"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('041fc38bed5b43e6f81962b872cbfbe4')
b2sums=('585c3a70ca8a1ceb352e50ca3f8d6e2bd541dd1489b6da5eb90afad276897ed137f2dbb74d6dd735d695c565daefcf9276a9b56acaf96e767477fa3c812fcae6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
