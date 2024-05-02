# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genoCN
_pkgver=1.56.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="genotyping and copy number study tools"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('725246cab4e8d0edf5dd6c0266ecde22')
b2sums=('7e20661834f42fdfaf8de793d6bdb1c01910e8507ea6ef2bceda2ff5924cab790fa234d7344d255d3ea9da14ba25b4e00c253c883305a563995fa3b51d6cf1f9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
