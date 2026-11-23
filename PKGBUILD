# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=paws.storage
_pkgver=0.11.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'Amazon Web Services' Storage Services"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(Apache)
depends=(
  r-paws.common
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8747d0fd2eb8ba53a514891425e5ef2d')
b2sums=('e5b9adbcc52f8e368a5372e4c02a0a26cce70de65bf4721ca45fba8af37fffbcdd14870f391ddef2193dae22de96b93291ade6ee9b97d22f4858110a7f72d402')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
