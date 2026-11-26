# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=AnVILBase
_pkgver=1.8.0
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
md5sums=('41196ce60d132c5fc146eae585603097')
b2sums=('3ff5c0044c28b524226ae2bd859ae7d7cb19e0f5b05bf5e02475c8e56a0a00fdc1a77ff4b1f6c8ad671b31698a8c1945cfdbe9bfd26a63fa2c2a7af97fa67efc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
