# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=goSorensen
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('03a006142bb604e84817524b9b1e5206')
b2sums=('3cb4bc47d4ebf1c8c7ce9155d188f5332c3b0306498bda28f27fbc081965479be3b8626069df94c216a11f2769a7246385b93e397ffbb464f83fcde67224fb96')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
