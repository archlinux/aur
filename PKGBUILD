# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=acde
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Artificial Components Detection of Differentially Expressed Genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('df39a71c8b906769d5894ea2ffab69cb')
b2sums=('40a7ed0aa0e762fcaa78956f67239777011eeff8c8edc8a44c454edb0d3db77624a0a66c367c0dcf9ec83674d5912bcae039dd07dbab9efa7feb5058fbab9357')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
