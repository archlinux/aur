# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=koRpus
_pkgver=0.13-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
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
md5sums=('87f5cf19ee31e22af6e8f099290440d8')
b2sums=('7d387b64e6a80d97d3aa00d9833ec2aca32cffa072dc3b1c09b3a7e3dbcf4a4a5ec765f886b1c30a2977296e50d1ba20d550aff992ef3f75a74f69e83d3eb043')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
