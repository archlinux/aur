# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DTA
_pkgver=2.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Dynamic Transcriptome Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-lsd
  r-scatterplot3d
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bf59b00066b698d3798ca1d4c1d908b3')
b2sums=('fff69addbdb98b867a0ef487682d2247a9b3a6d8fd5cda1df789689c73eb6fcd5af8069c92a90ccd76741ca7f9ce5244a782633df907abe2cc420c2d5ff54f18')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
