# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BeyondBenford
_pkgver=1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Compare the Goodness of Fit of Benford's and Blondeau Da Silva's Digit Distributions to a Given Dataset"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-ggplot2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a761dc896448643d91f7f27de529fd23')
b2sums=('51b37877df9d8f0b42ca52d1d73e9109a784a619aa3ff9d8c32ceba33eb160e77c25169476eeab360b9313b7164a50a47ae1d21178cc480a7e98f63a9ca69377')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
