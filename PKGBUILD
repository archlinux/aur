# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PathNet
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for pathway analysis using topological information"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocgenerics
  r-pathnetdata
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b02488a354a81ad33c20c1f9fa0f4bce')
b2sums=('e3c36298388b2bb1fdceab615ae064d960ecf9e01295eededb3873d1d771e9607d187a89a68e11f38dc0ee1c7ca1f2753439da69e91156b87b1a85a64e3986f6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
