# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=reportr
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A General Message and Error Reporting System"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-ore
)
optdepends=(
  r-tinytest
  r-covr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('97c9bc0c22835ae0b09e273ba814a331')
b2sums=('6797ab93c8c00667aa24bb35df3f459bbbf854c53478a3743c9a14e850c89c89db42d75d06e362232069614fa8f2867235e475aee93bd9c13e4c3e21d8de65d1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
