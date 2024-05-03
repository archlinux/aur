# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MetaPhOR
_pkgver=1.6.0
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
md5sums=('27c4047c59ed65781e48ee3385b798c4')
b2sums=('a516cf2f1eb1839322527b781546943e8f64875f5ca2b460f9127e2bcb23d6227a7a39ef85aded6be27687e80de666fff2fa97855ed85e265b032bde20ef38ee')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
