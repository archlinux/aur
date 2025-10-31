# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=miRBaseConverter
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A comprehensive and high-efficiency tool for converting and retrieving the information of miRNAs in different miRBase versions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('846cad5232dd14e29735d88ed9903c8a')
b2sums=('492d28e7a1ebc1e0c64dbbb836b58a96d5dcb012342f33248e3ea04a365ce992a5f0bccac350936c550dcf7478824b04fe9027604d2a4ed68724cdc132237ecd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
