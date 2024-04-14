# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss
_pkgver=5.4-22
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Generalized Additive Models for Location Scale and Shape"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-gamlss.data
  r-gamlss.dist
)
optdepends=(
  r-distributions3
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('59ad990bd4ea3698cfae1e10aa0e3d4d')
b2sums=('9c5702ba4776e48edb61ff1ddd65974a290f0e6f8d227c1fe44fc92b8cceef8a569b5e04323ffa7cb4f90c715158910c5d9f69f2c59313a0fd08b48a07db7b45')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
