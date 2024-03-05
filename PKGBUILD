# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logger
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Lightweight, Modern and Flexible Logging Utility"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-botor
  r-callr
  r-covr
  r-crayon
  r-devtools
  r-glue
  r-jsonlite
  r-knitr
  r-pander
  r-r.utils
  r-rmarkdown
  r-roxygen2
  r-rpushbullet
  r-rsyslog
  r-shiny
  r-slackr
  r-syslognet
  r-telegram
  r-testthat
  r-txtq
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ffd57ef28ef487d204e18c0b72ed45ae')
b2sums=('bfb96d62c7b6160b7680607bf4778e7a7332022f08f82480b291c6274a3ed6769a3701b829d4349269054fef3fd677ed38a7a274ab4e860793cabb3f9d432e17')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
