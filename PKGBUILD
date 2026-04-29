# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HybridMTest
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hybrid Multiple Testing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-fdrtool
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1de43fe070de6e13f17093255370aa31')
b2sums=('da747fe5cc20f51a41fcd80f7f38304557efd3dbd69aa69e35c1f52f35f891f4975387a033866d0d589e7a89ba362da91a913d6fb9f9a34d72f46df7f59efc98')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
