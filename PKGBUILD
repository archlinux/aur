# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=AHMassBank
_pkgver=1.6.0
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
md5sums=('771a7ffcb78436003de5c057e9c665de')
b2sums=('3f205b2033735eccff8249f0bbefaa685eb460d971935ffc9e1b9a4bf9595ae745d499ec1b1d88d398a8550b2a296ecfdd6045306a2ca6bba97ab2e196f8e54e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
