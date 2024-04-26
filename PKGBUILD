# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=goSorensen
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Statistical inference based on the Sorensen-Dice dissimilarity and the Gene Ontology (GO)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-clusterprofiler
  r-go.db
  r-goprofiles
  r-org.hs.eg.db
  r-stringr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8fa5cc982341291dd857ab340abe4c73')
b2sums=('233116882af6f71d6dc0b37c213617d0e0196b22281859c4b8ff8d19f84b9838cefb88b5ecca7bb820a97cf4cece465c71d2ed0fc035afc92f46115a2d3b51ea')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
