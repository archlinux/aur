# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=goSorensen
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical inference based on the Sorensen-Dice dissimilarity and the Gene Ontology (GO)"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('bd11519691515013723337c1533467731ffe7b727cc5221bc19f65707cd6d1e0')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
