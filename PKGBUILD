# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sangerseqR
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Sanger Sequencing Data in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biostrings
  r-pwalign
  r-shiny
  r-stringr
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c1be82500d85b9b2dc49647348268d31')
b2sums=('4db99c5e2d06bd11f45c4d4a8423e50c97940479556a7ccf33f9a081519dc631c5c7e16c8a35b5290154141e0e19e9e0b7d571e189bf09b2612dcc12c2597e34')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
