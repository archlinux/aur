# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=twilight
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimation of local false discovery rate"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-golubesets
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8ddae2f1c56d69f484142d1161253a04')
b2sums=('ac89f46d91660981d6c88ef2761db09a029ca0226e3fc9fce6446745282490065a37f9c7f6d8c74521dc22fcc54d381331ddc7e3ed7782cb2111295f1c265362')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
