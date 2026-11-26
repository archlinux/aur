# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MultiMed
_pkgver=2.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Testing multiple biological mediators simultaneously"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3761ac326fd82f25f01b67442c2c0f83')
b2sums=('d5cfbece96377e3849180943c0085ff009fddda46f443409ed2f7d00d6c724f9625628de0b5ee5bd445ca11fa2c82c17a5a6b0e7907848aa71cb69600f4c3ece')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
