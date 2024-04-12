# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SBMLR
_pkgver=1.98.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="SBML-R Interface and Analysis Tools"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-desolve
  r-xml
)
optdepends=(
  r-rsbml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('36433007d11730737942753523a9d91e')
b2sums=('6ed3aa4b75fe5adadd8a482ad75eea457798037ce167046cfcc7d0c69e43ba1729b80f712eacfce6ce96db6ffe4f4b7bfe0805a431fc0b02b998bbb7184a59cc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
