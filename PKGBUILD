# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Alex Branham <branham@utexas.edu>
# Contributor: fordprefect <fordprefect@dukun.de>

_pkgname=distr
_pkgver=2.9.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Object Oriented Implementation of Distributions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-sfsmisc
  r-startupmsg
)
optdepends=(
  r-distrex
  r-distrmod
  r-knitr
  r-roptest
  r-svunit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('516d41cdd753fb0a200d0122332ed9b8')
b2sums=('f505a8da163f8bf76a9b42614911e132e94f21caf3a9359d87e008fe7ad5f5e9934ceb70b114dd85fa3149322e9824b9c891c7aa2b8d0c6b102c5641595f86e6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
