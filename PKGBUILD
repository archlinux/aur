# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=dotCall64
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Enhanced Foreign Function Interface Supporting Long Vectors"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-microbenchmark
  r-rcolorbrewer
  r-rhpcblasctl
  r-roxygen2
  r-spam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e645e9c27a51360d272da63737862e42')
b2sums=('9c0cca3cc4130b7e1b70eb4264cfd445c4e3b4ca49012e79dc93d6beb547736045a778bf9bf3c27e93e0b15231da306f1682b54d88d1de20d275199cc2d0d59d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
