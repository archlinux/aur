# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=paws.storage
_pkgver=0.5.0
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
md5sums=('c346325ae9e1716359ddc85eed341412')
b2sums=('a3b2cdbe718b270e9de9c85458975167cdb906281a1829e97fe7d1517caa8269da1ffab68900233506c983729d83d40bc70773375bc9e196e6e037cc6ccfe979')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
