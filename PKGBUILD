# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=AnVILBase
_pkgver=1.2.0
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
md5sums=('9be10d0971430089948412acac7358de')
b2sums=('665bf970ff39f4aee3e25dd22973247f671ce8c4b7dcf6adbee04619b7a175791839914382388309b65f4ed242c1dd672f3d7588e8edf8f1625239694478caa4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
