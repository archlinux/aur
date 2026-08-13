# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=AHMassBank
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MassBank Annotation Resources for AnnotationHub"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhubdata
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-compounddb
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c79a6541e911c5c794db337a6f787ff0')
b2sums=('d26c9049a4438086d0a6560fe641b488be735121a06e5e5a1291195cc99630bd29c6ba6483f9d6b533b51338b4583b472cc410ec6181ebef2bf352a96078c846')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
