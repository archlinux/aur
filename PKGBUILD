# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ALL
_pkgver=1.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A data package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d5e56e891b5a39c30a1983e39c7c54ec')
b2sums=('24ba4fe1c9d2860d1934c1006f491aafba82bdf78d6403e2740a51ee189dea0d60e86754fba273849d2bf79a6e28f66e3dc69deab78f3930746eecfe2e7cc42a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
