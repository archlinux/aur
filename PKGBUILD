# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mefa
_pkgver=3.2-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multivariate Data Handling in Ecology and Biogeography"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-mefa4
  r-vegan
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7cc82dc53a2f47423125ead8b370ac45')
b2sums=('d66c6bda04762125ae30472bcef62b1d9c2a554bc5dfcb2bf631984566ebff13ef5ed8d1dec2b32d6ff7bd98fac6b037078d231fbf320afdc8c000323712ffd2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
