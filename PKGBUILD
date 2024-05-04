# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromstaRData
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ChIP-seq data for Demonstration Purposes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5680118a8394c29faa4ec6877151bd3a')
b2sums=('947541d4a5286ee11f90f4ca95bc928fce370864c9fed2752675d32adfa335b4317698334f9c6cfba0700b79f1e30371e7b7f844b1e1c01d028d4573fe37fdd6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
