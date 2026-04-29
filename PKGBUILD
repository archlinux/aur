# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rawrr
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Direct Access to Orbitrap Data and Beyond"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  mono
  r
)
optdepends=(
  r-biocstyle
  r-experimenthub
  r-knitr
  r-protviz
  r-rmarkdown
  r-tartare
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5a42c1960b15e032e9cd7ce18cf1d7d9')
b2sums=('f93a5a6b5acba2e4ed820c80c5902ab2717586f7d64b3ab02d10a52fb4fd211df038556fda887f18055495f25dd2124ea8e740d25e57e5131e5a023be57d9a01')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
