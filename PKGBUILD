# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HTMLUtils
_pkgver=0.1.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Facilitates Automated HTML Report Creation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-r2html
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dfdfd0071ccdaf1d589c20a8513d9752')
b2sums=('5b395b687bd257a77f271b4ae03893f94d26e9f3a8cb3bef0b06772240b736bcd7696b81c4dc96c1c6e1baad89c4af72fccb39e9e4a2355ec1fe3c79955f0849')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
