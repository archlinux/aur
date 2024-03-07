# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=digitTests
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Tests for Detecting Irregular Digit Patterns"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-benford.analysis
  r-benfordtests
  r-beyondbenford
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('042939d50f5a96f5298d77069167d227')
b2sums=('def1d38a3511adcfb64ba50af2843c9724eb8ccc4b9789ca9b08231dc4aacec14ac9219a902270f7e71fbe6a094fd94cac5f82d064274a35acd2fe983d034d71')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
