# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BridgeDbR
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('2c155c28cb8d117e2dc1b69873b91d84')
b2sums=('750ad9fa088c12ce984fa5bc33f83959b90c817712432b76053bc59f7306f32f435b014c0f86bfe86682afa14c79a240d29675a5e84abb78542064f34adb238a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
