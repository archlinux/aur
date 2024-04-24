# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yesno
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Ask Yes-No Questions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2b35fba2de07f303fc5eecdb0eb69ee6')
b2sums=('3d9cedeb46393da9e96205a429fc92acef68cd5a1eeaa1b3d2e93de3e9c3aff0f150c41789600175b10a13b66dca3006bcfdaac9c1a14f90ef32f516489a1cc3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
