# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plm
_pkgver=2.6-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear Models for Panel Data"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-bdsmatrix
  r-collapse
  r-formula
  r-lmtest
  r-maxlik
  r-rdpack
  r-sandwich
  r-zoo
)
optdepends=(
  r-aer
  r-car
  r-fixest
  r-knitr
  r-lfe
  r-pder
  r-rmarkdown
  r-statmod
  r-texreg
  r-urca
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d79cf0f7deb647e93921ebc699a26b4d')
sha256sums=('daab0b875becc2cc84af2fe748261d5f8a994fbbfac5a169413a718566e74c03')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
