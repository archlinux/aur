# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=blockmodeling
_pkgver=1.1.8
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
md5sums=('8c89178ad36be80e43b5c7d3f7956bbd')
b2sums=('5a4912988ed453062c3d521fbdc35bc035b2153185a7f6be3c46ea00073f6b17921b2399dbe957448ced845878fc08c6e10898756702f5aca4324d80a5774317')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
