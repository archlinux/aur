# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=shinybiocloader
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Use a Shiny Bioconductor CSS loader"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-htmltools
  r-shiny
)
optdepends=(
  r-quarto
  r-shinydashboard
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('095757c0264a196aa4ee1c78dec81670')
b2sums=('900728684d1131fecbba478e8a30206dd3c210a87d0ada9fe234ef9a47893fb322c8d15714cf96e50ac0eab5a99e2dea2a7f60a7614daca0d6165fd1f3543e4a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
