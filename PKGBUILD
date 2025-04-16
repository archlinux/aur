# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BeadDataPackR
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compression of Illumina BeadArray data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cad04c4a78b71c3ecff2c37d58ddb71a')
b2sums=('5c22cc9588c36463615456793042dfa51f3ce802eca2eeec1bbc42affec99da1c2ffd67050d2d9883d34246ed6c3d14932e2775baa8528b4a2b7b167c2cf4d96')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
