# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISOcodes
_pkgver=2024.02.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Selected ISO Codes"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('65379246fbe90371859da3d4df8b8ad0')
b2sums=('a5d47633891cebfd34ea922667d1e94f8fdaa54654a50a9febc87e01d41146d43c7f7bf9f1fe94b918f87c4be9f005cdac6dc4d2bc2ee9bbd166e7729d430e87')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
