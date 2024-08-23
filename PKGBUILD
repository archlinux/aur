# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=poibin
_pkgver=1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Poisson Binomial Distribution"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8b5262241d78a182923b68aa61b70af0')
b2sums=('0cafc80790640a0718279566dd0c4d8d19f234101a0952f7bbf1739e8f0ff8cbb3b906894af1282b3e0a685ee08441aa7c1b4b2705fd6ff596e63c176d5f0196')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
