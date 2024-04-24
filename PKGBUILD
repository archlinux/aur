# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=JASPAR2016
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Data package for JASPAR 2016"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2976e4678291944f664396385049180b')
b2sums=('05bc6075e71cf3f6aa930476a7cade5e5fd699276d23c0c4a44544d120f7c56d1ff708f8df0aca01abd8a90628258c65fb5025a66818e604e01b3387b8048f3b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
