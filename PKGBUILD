# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss
_pkgver=5.5-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('db463a28d6ca2de1e21ac968ad62917c')
b2sums=('c24bd934b58a05aef8c6d44dfc73d6871423b2e4ec85a489cbb1cd655d594bbffd9e29a015e22a9873473c6c450814b34a3511bbe4eb6bcaf33020b61c4cdf87')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
