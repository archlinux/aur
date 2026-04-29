# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PROcess
_pkgver=1.88.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ciphergen SELDI-TOF Processing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-icens
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec15b11f9f509a464193cd7cdb121b7b')
b2sums=('ce47c5585d10e45dacd910572df135bf3a3300b2708371861312a5785d2c1e1482d355cb66686c08981773933d7f7bdf28cb39c7ee738ea03d7614ff99afa0b6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
