# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pamr
_pkgver=1.56.2
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
md5sums=('a5cd60573771a8c9fc3ad9c41cd05157')
b2sums=('db2269ec3fa48e78ef0a2045ae15d995f705a3c9bd94def418f9652e5076fb019c22ef31c662d92886466ef08c80130e8bcd461cf1cfe22d1e54b5d834e4e83c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
