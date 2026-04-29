# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=geneClassifiers
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Application of gene classifiers"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biocgenerics
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ca4f403c73abefd8fe7e26514f1c4b3')
b2sums=('b59c7683c62cdb949759c2b786d01e80a84863f2ff3b1edc055e86fec9f3d67d18015213367b7a7f06c611bcc877dadaa2d49d1d9cc97b7ec96ee35c092f231f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
