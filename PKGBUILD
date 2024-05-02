# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sizepower
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sample Size and Power Calculation in Micorarray Studies"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5838d76b09ca1e7a1529dbbc0a534466')
b2sums=('21bfa4886406b87e1560e4233c7a480b73f6e112d887c88356ced3974a618e7f969008d5cbecc65cc5dd8208d441c51caa7e4d4370d0832bf21dd33aa9033653')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
