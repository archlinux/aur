# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NeuCA
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="NEUral network-based single-Cell Annotation tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-e1071
  r-kableextra
  r-keras
  r-limma
  r-singlecellexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-networkd3
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5761042e8cc461392b07e8eee6fc32c3')
b2sums=('25b4b60007635305a53e1584b5e91a5e0386d8b7c1146752963c1f51ba17d61ec5edd18b969bb42f517584264d47b58d5fd2127b667a56ec859e08329c819479')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
