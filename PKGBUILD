# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=akmbiclust
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Alternating K-Means Biclustering"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f4d2395f8f433f0b8ca54c31f367e491')
b2sums=('55000ade7f023aa0d4530f6563d756428b9db90b26338847d961dc5fa1d4c2133f7dce57fc2b38d105f3b9b6a3a26b582ce281546d4883d8bf31878f1f24b88b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
