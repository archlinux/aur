# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=unitizer
_pkgver=1.4.21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive R Unit Tests"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-crayon
  r-diffobj
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e023cbe14710eb11f2469de609c9bb11')
b2sums=('4bc745c2e4fbcd43a251d48ba8da69a7da3a7eb7eafac45fb759d7a0f32878b8db9746d64afb6980ab116b8e096c6a416c42bac77275fc46e73afa1b437050df')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
