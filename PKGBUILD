# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mlogit
_pkgver=1.1-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Multinomial Logit Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-dfidx
  r-formula
  r-lmtest
  r-rdpack
  r-statmod
  r-zoo
)
optdepends=(
  r-aer
  r-car
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-texreg
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('08c4273d0762bd0044cf6677c927df9b')
b2sums=('fafd1fc1f2bb6bd1cd4dabd71769a179e26be97ed1211377c9bf83c612aa3e864ad52f0b679b85f6f8465bc28a33faf182c523b171d55975fade45df27c7be15')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
