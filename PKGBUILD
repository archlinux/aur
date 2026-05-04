# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=AnVILBase
_pkgver=1.6.0
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
  r-gcptools
  r-knitr
  r-rmarkdown
  r-testthat
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b59133c286cd7c4a4385b74675aad9c2')
b2sums=('3aab830ef9848043aa8e48c88a208be0bd34dc095510c63620ef657ed600a3627c232315189af3d31d9304000e78ec9a80e520ea02ff68b8e779a3eedb41a88d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
