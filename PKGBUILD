# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PLPE
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Local Pooled Error Test for Differential Expression with Paired High-throughput Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-lpe
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('81edee4386ace496ac3c234c5a7c4f23')
b2sums=('a6b90b9d2db797c55d937424dd7a50416601aefe850af04dab942a914aec65726583fa938e663b4b618aa4b2191cc4facbbbeb1e83f6d1b2680d32a974968d7f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
