# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=r2r
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R-Object to R-Object Hash Maps"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-digest
  r-rlang
)
optdepends=(
  r-covr
  r-hash
  r-knitr
  r-microbenchmark
  r-rmarkdown
  r-testthat
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8e398a83499849d554782004ab7d01ad')
b2sums=('0993e14eeb9e1ac4cfc6178250d6b136c942fdcab48779576cddc24e686751800e4a0c246157920f1b2b90f3de7ae5ec74e9ae90f657a26d170a1f6c77dd7e17')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
