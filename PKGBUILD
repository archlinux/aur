# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nor1mix
_pkgver=1.3-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Normal aka Gaussian 1-d Mixture Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
optdepends=(
  r-copula
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2309fce297cbfb80b367b7c7f7cf007e')
b2sums=('a1fa2885e170f9bb66f4e5d17c413647040524e39018d37a3182f3144a205df5de4fee0071a813ad9f10681b64337e99390ecc4d813705abca662175ab453002')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
