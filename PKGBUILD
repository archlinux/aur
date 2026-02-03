# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=koRpus
_pkgver=0.13-9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Text Analysis with Emphasis on POS Tagging, Readability, and Lexical Diversity"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-data.table
  r-sylly
)
optdepends=(
  r-knitr
  r-korpus.lang.de
  r-korpus.lang.en
  r-korpus.lang.es
  r-korpus.lang.fr
  r-korpus.lang.it
  r-korpus.lang.nl
  r-korpus.lang.pt
  r-korpus.lang.ru
  r-rmarkdown
  r-shiny
  r-snowballc
  r-testthat
  r-tm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('06796bcd2502b0aeb9308c9457ec55de')
b2sums=('0d9f9b55450fb7851b519410b22238e0d1788e4db9f01413beb3a1b8ebf2e005618e422ea92d65a0f120b1a03dec3f184968231d24c8c610a40c353eaee6bd62')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
