# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISOcodes
_pkgver=2026.03.28
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Selected ISO Codes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('56755f122c49f4b08937996662875dff')
b2sums=('01ded0aa6830a7ee76be71f080f250fbadd1c8b42df566b0822423fb40bea402aa21c7bf2b6b9eac352c25cb65df6da680bedfce935a3b7ccf29c266e02efe50')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
