# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=semisup
_pkgver=1.30.0
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
md5sums=('6c4a3b77b2d1403bf24cc9954c7f7148')
b2sums=('eef9bb6c1d3c72a6cbec449a38265962765fdf1cdd23eefb736b32f78b366f8a67294d17fc682c7453c635368a5925cd6aa6a2fe08800b3d02a90cec4c56a947')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
