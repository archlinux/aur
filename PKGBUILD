# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sizepower
_pkgver=1.76.0
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
md5sums=('53bba3b5f22b789f25f51d04692e3f3b')
b2sums=('260e31b8ae6831dd244be532bfc5fce2d77590cbf4980cbe57f5eea94974ed0ebe21d2ee6a82fe109888460013cc890fc706fe0e5068ff64854d8d945d719141')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
