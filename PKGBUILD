# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=AHMassBank
_pkgver=1.4.0
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
md5sums=('cb2e8e8e3e58550e07833d7bf054411d')
b2sums=('088182ec6c684ba18bf25125307205a165fe9215a2674afb192f07391368fd90c9bdbfbf7b5d1a1863bf33049ae9ece90f0df609558ecb89a99f61930128d42d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
