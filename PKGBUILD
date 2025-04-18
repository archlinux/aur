# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MetaPhOR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Metabolic Pathway Analysis of RNA"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-clusterprofiler
  r-ggplot2
  r-ggrepel
  r-pheatmap
  r-rcy3
  r-recordlinkage
  r-stringr
)
optdepends=(
  "cytoscape: cytoPath()"
  r-biocstyle
  r-kableextra
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0490cd26762bc9c50cd36c9525d327e5')
b2sums=('a6620d8403939bdb657cb54c4b7d99feea58a4c67b593e342f5301eb92837a669f9dcbe1c0045c913ac6bb0586c05eb7254de1e3748fd8796b47705868f7606d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
