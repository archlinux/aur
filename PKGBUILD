# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=simpIntLists
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The package contains BioGRID interactions for various organisms in a simple format"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5208739e1a07da9cbcf627d0999cb989')
b2sums=('22df76bab01751dfe23d85977311e5ab6dd70bc29d05c0258f4a61491bf5778d3d640d63cef028df3b7b31f4d821c86b48c28999cb4b4e0eb4150445990da0b2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
