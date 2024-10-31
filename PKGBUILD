# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=randPack
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Randomization routines for Clinical Trials"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3b62e01dd95b189100960ee0c9691b7f')
b2sums=('7b8485fda0e7c36a539122f95f094912464b3640529cd59c19110f6d673e68ff4102ca64e6d4c0ced5df5bf369f2212f30769432e26be0201259b486dd23198d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
