# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=semisup
_pkgver=1.32.0
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
md5sums=('b18ced64c62c001cce34fad0932c76f8')
b2sums=('c5bb70a33312ae28fd4517ff61055b88956c2ef451ef1d9c5dc48f7bc737ccb726f7982f4aabd53c5909e739a6b37918ef6f964bd0ebec410311c1aa65c22a35')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
