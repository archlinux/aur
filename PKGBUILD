# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fingerprint
_pkgver=3.5.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Functions to Operate on Binary Fingerprint Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-runit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9f3ce05294da928bc745ad06e562a709')
b2sums=('cbd16af67bdc8a5313b0533addc97523fdc7ef537b8882b8bf752ad90cf30a92e87b567a54f16731155475ad8b819b18de4e75ef1d7f67f5f5cbc80f9755106b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
