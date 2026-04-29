# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BridgeDbR
_pkgver=2.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Code for using BridgeDb identifier mapping framework from within R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-curl
  r-rjava
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2e0080b4ac172b4b1a23ff4fc82cb5e1')
b2sums=('24b4f824752cefa40e397933fab3a5903ea6472e519647dfc1e3ed80fafa2f0163a967a888cc56742a54464b971ab159de099ba223e7748efe2c5ce8b2caa530')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
