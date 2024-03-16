# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dtt
_pkgver=0.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Discrete Trigonometric Transforms"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7707b3ca36465854b99e29729eefd50e')
b2sums=('7976130e22335d4347c477358d8a3ac8f303171a409dc13b051b38ea027337c22db85089330a79054507be08799ca9bcee62c031927da2062d33a610e03c5550')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
