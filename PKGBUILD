# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MassArray
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analytical Tools for MassArray Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f89ac171230e19d088dc86f7b73b22c')
b2sums=('60fc0db49b7308d39f8f3adc317d15c75beb9b94cc39f984f610fcb2dc63ef1694404e301a8eb0cca2ceabbb83f10a1172c87f1d379061d9fc9dbedcec897f9f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
