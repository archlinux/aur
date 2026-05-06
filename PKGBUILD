# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=h5vcData
_pkgver=2.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example data for the h5vc package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-h5vc
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4e4fc94c71dbeeeb41efce64947fdceb')
b2sums=('1a5e7c834a319da9c09547fee118d63079118e850c1146dced0ed96e405a304093faf22e7875b28436281a0e7a1f3ee876684693af4adb43c661d6f18a6bdd46')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
