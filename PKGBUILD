# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logger
_pkgver=0.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
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
md5sums=('379ee674e7ca9aa384e01a338aaf1322')
b2sums=('5d1a1c4144df2de5583c67f2ef3070d1c465a45a15ae952d75bee876d84b0b957f34b06d0e8b6e43d162a4fdbf922479484805393a67667d763d88b54e40d366')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
