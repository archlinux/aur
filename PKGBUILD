# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pamr
_pkgver=1.56.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Pam: Prediction Analysis for Microarrays"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f82a9d53ed7f7b4a619c7a134d4c7887')
b2sums=('1e3e3adbbe226c4e2de0bc30d978c21b8c9500491ae19ea701078886ede907d8bf856943af83403c141cf4940c8eebd2bbd8a7755fddbd7c7b3653de7efd1767')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
