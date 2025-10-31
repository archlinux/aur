# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=semisup
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Semi-Supervised Mixture Model"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-vgam
)
optdepends=(
  r-knitr
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ad032c7d45ec0acb1d0cbea9ebd440fe')
b2sums=('4d2f4844431bde0860a7d63fcfd6d3702f1acaa611fc12538db786b77fc9008b247dc7a8fc707a0c84890c107546fab5534299c1b67167ac3618af876ff2d013')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
