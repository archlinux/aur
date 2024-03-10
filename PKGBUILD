# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=log4r
_pkgver=0.4.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('48d5f4212c65e91cbd900c2fbaf2f3d6')
b2sums=('2ba50dbe1312f564dba282afda0adf9ecbd1b7f4e2e7e9ddb2b1f12f398286c5523321d7686c0733831d19b0d05024f485f90d93b59cd721570c94a8891ee31e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
