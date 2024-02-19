# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=blockmodeling
_pkgver=1.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('58c7580702e7f216874c71bcb94cbdce')
b2sums=('f0dec0f1401d8c97e194fd6452955e3285948c3bfd3a20fd2e7a62b5286f5ec3217e3a4f707c844395203ded18d32cbfc2e012482ebba08e36d0c8322f4f17ae')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
