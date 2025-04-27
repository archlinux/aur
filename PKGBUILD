# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=AHMassBank
_pkgver=1.8.0
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
md5sums=('784d55b63749189da601a92ca1e6d4bc')
b2sums=('5ebf26cacbad126be10fe04d1a1aec46ca3eb6c37f96eb48f55dcb68cb3c6e873ef421f57476f7a20a2d174ee1add834c09f55b0e11b24e0f3da7c2be0fbc04c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
