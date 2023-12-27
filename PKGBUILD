# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CCP
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Significance Tests for Canonical Correlation Analysis (CCA)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cd2ff46d0432e37b1cf3909f410343eb')
b2sums=('a4d4ae85b6f08890324ff84d28670c8abf1b46969a0ebad9141aec5c7a8c2dcf56b80195d4edfe067faac9af52a92d90b2addc9011cc2568be2d09654263d36b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
