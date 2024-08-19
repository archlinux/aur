# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=wavethresh
_pkgver=4.7.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Wavelets Statistics and Transforms"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7c5c6283074dd23b9ce9cd33ffd2b276')
b2sums=('1af43610560bafd29f232c1d567e565d8e7dd915e4758d5abf1151d63903e7abc29d5abbacbb29185355d1669da41c3e85001152f7e2eb6522db804b330a8399')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
