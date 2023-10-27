# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=AHMassBank
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MassBank Annotation Resources for AnnotationHub"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('b9ddc7dff0cabd4b170bc750cc3c47d3')
sha256sums=('59b7f729619d0570a882cc03794a469fdd72ef25d2519bd4ad65483e8f9fc61a')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
