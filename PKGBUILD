# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=shinybiocloader
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('28eb7bea06b3e2f9354de1798cc2286a')
b2sums=('4b3ae49b678be4181fa39f693d84269ac5b7411f2a34d23676783ababa0f25c303d62457b68197b5258640721cbf788890f3fd48d33878a1fc27ca5a4f7561ca')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
