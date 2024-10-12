# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=log4r
_pkgver=0.4.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Fast and Lightweight Logging System for R, Based on 'log4j'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-futile.logger
  r-httr
  r-jsonlite
  r-knitr
  r-lgr
  r-logger
  r-logging
  r-loggit
  r-microbenchmark
  r-rlog
  r-rmarkdown
  r-rsyslog
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6e9876924f52202a0e6437b1551b986d')
b2sums=('ab8bf5b9217d471e13e16337ca09254e2d498d9d2f45b4da5782dbff639ca8463023c75a93fbe5d03bf7c5b05fb38359508db6ac79261cf83bbf79d62b3d46ea')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
