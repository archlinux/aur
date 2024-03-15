# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromhmmData
_pkgver=0.99.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Chromosome Size, Coordinates and Anchor Files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eec85c20139b3d826f00264c7b28207c')
b2sums=('807d3e4f6b477f6fd7afc977a17f7187203a1da053c73176ae4c49f31910739404186f7b1bec8d0cc74dd717eb4f45a3ca9f528acdc1d6c2249d716e8ec213c3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
