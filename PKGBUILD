# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=hopach
_pkgver=2.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hierarchical Ordered Partitioning and Collapsing Hybrid (HOPACH)"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-biocgenerics
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c46dcca92ece71d7cb672e53d2a989c3')
b2sums=('d0c4a9920bd209413c3eb621dbd986fd187b5aa85a254770c05be4c3b3e9bc0a1624f1964d5039846e4610bdc1233e4fad12a2d43eae76dadde9096fadbf9e0b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
