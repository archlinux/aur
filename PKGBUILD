# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RandomWalkRestartMH
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Random walk with restart on multiplex and heterogeneous Networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-dnet
  r-igraph
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ace5e6d73a365094a41a864a47deb893')
b2sums=('9306b7da69f9837f020bfa67eebe676662b6281bf5b5588dc2a333b2a03afed43c3f24fc93f539917ff385bcd1992385c81bc073ecfb323419c17309adc75f77')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
