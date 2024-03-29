# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ISoLDE
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Integrative Statistics of alleLe Dependent Expression"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('448414b250ff7c903395638de3688411')
b2sums=('bcb63ed3ab162c5d194a2f4470cb9fc455a295dafdeaacfdae0ff24fda7c6278c9684873ecada6249d44ee45afe7d87a295e7de351b00c84029043bc14c9cf59')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
