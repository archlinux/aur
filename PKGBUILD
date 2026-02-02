# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sylly
_pkgver=0.1-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hyphenation and Syllable Counting for Text Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sylly.de
  r-sylly.en
  r-sylly.es
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('884547b300505e7bc777dedc98271bb3')
b2sums=('6e49167e563d578be93a4308314233d92b076aaaf66596070baca910d2bb6eafa418bed6e232ee1aed5c3c9d9cc17c0b8688f74f75638c66798175ef7107941f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
