# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=fastmatch
_pkgver=1.1-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast 'match()' Function"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('69ecb45abf03a50ed3cfb30da1fad8db')
b2sums=('3a7ff4a260f4d324fffc042ce5c3d0af4a5c3e66f52bd6f515b409d042391f3820d35e99f5cf3e64fb5c40ea1ebb94d01af9c61d01e39ef1aa71412273c1c100')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
