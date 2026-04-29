# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=annotationTools
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotate microarrays and perform cross-species gene expression analyses using flat file databases"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-biocstyle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a8f58d245afeee5bed906ac932e21cba')
b2sums=('7bb7a4e7d2c0f3709db5d2f676c04be0e3d4371bf2ad8deeb8651905a2b88d3f216d8c0045249d5a64508fee8c9e46204049bd7ad051600e279ab8fcf3d86b66')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
