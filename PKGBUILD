# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=PTMods
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Managing Post-Translational Modifications in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-knitr
  r-testthat
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('770a1a8642945ef5aadcc3a39fd91de8')
b2sums=('171a28e2ffd531bd502e42d240e74bc23234f1352ecc23d7711725ad276f6b5ba2a08094410d13f8593947ffc36855f018a5f8a74fc894b113cd2e7a94f28a9f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
