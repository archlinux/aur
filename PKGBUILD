# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=AnVILBase
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Generic functions for interacting with the AnVIL ecosystem"
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic-2.0')
depends=(
  r-dplyr
  r-httr
  r-httr2
  r-jsonlite
  r-tibble
)
optdepends=(
  r-anvil
  r-anvilaz
  r-anvilgcp
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('14d636c9cc9f4fcbdb7751b8d70233e2')
b2sums=('e30de6f8410d3db4876cf895f690c8feeca3df7f1237036a6dd4b17025d05760ce50e475f68e4f0254fb57aa7b14f30d5d5d765784769b37370e6d6387888105')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
