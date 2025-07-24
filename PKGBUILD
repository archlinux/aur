# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=blockmodeling
_pkgver=1.1.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized and Classical Blockmodeling of Valued Networks"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-doparallel
  r-dorng
  r-foreach
  r-sna
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b749d0134d50870965e9c15e3b1f1ebf')
b2sums=('6dff8fdad29ae0bbdd55109e0f3b4f386df9908ae534334846c488daa4a3419ddf687b6cd1f80f6ad3b7a7194a66d9fbef5bea8bb10327b02046626e24905c29')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
