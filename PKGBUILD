# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gamlss.dist
_pkgver=6.1-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Distributions for Generalized Additive Models for Location Scale and Shape"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-distributions3
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e364df02cf45c533cb09736d46a082ad')
b2sums=('eb6197520af3f89881361b4c2001b43b81dd0007d1c3db1db6cc0aa5ed47e548343e2102a8c1382478521c96a3d1bd79adce9052ce230d9bb0912f22b27ecc0d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
