# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MetaPhOR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('311e286126427130d127b23a77b3b6f4')
b2sums=('29fc0b52f142a96f98ee2c053ecf5b096a5e08452dc6665384ab563a22d7435a1a073ab44bb3a10385224e142edcba903c97d76f6037fe855db6018dbee62674')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
