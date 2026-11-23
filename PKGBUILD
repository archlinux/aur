# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MetaPhOR
_pkgver=1.14.0
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
md5sums=('637cc53932ec58dab76a517b208f425a')
b2sums=('3ce7f6cf5c1f93ce58355f691c3f1cc49327547260f8fce8cf1dfb07c8bf6448157023be89279e3c56021c8c89d862d8e0d542b6724441830346a7c3259563c3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
