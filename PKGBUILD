# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GLMMadaptive
_pkgver=0.9-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized Linear Mixed Models using Adaptive Gaussian Quadrature"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-matrixstats
)
optdepends=(
  r-dharma
  r-effects
  r-emmeans
  r-estimability
  r-knitr
  r-multcomp
  r-optimparallel
  r-pkgdown
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5425f98c02d9ed56c6190b5c2b11dc8e')
b2sums=('d2e8007729a569ebeb2b7d498bf4ed38076526c3a6610537ef79f28ecb32c757d31b2350b99c17bdea39a3e70276f6fa563001909464c6baa9d47fefe727d75a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
