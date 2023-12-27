# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmpi
_pkgver=0.7-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Interface (Wrapper) to MPI (Message-Passing Interface)"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  openmpi
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ba8538ddb5d4c12863d5b16e3d64f290')
b2sums=('c59054786e90a5d98da365fcee3ccec55399dfe039feacfe2530850505c7ded50d37c41328a3393cd76ec18ecf21fcb0ad0614eca4b400996ac4924c8521cab8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
