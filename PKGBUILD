# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=zCompositions
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Treatment of Zeros, Left-Censored and Missing Values in Compositional Data Sets"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-truncnorm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dc7a3a246d86c1c9873b31e0d8496935')
b2sums=('dbabdfffa3fb4b92708ddb9c68326da2136294a87b44bd3d972e75b0d2aa13d6126a6fc290e9e98aedbb7d02474a0586e5f0e55fba44e4b25cbca5a1b64ffca5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
