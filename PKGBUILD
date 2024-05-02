# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=factDesign
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Factorial designed microarray experiment analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-affy
  r-genefilter
  r-multtest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ed3fe48f7e5432a81fcae7ba9086ac4c')
b2sums=('f7c19426b2792df07893d4c91dbaa05fb3d036c92ab332c903871b23086c0793a47ac84699d76a8052c6963045ebddb166156200d524a05d7c9490295d47e746')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
