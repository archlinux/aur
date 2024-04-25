# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=clusterCons
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Consensus Clustering using Multiple Algorithms and Parameters"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-apcluster
  r-rcolorbrewer
)
optdepends=(
  r-latticeextra
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fc9dc671ef0e4e5574a319bd1bca10c4')
b2sums=('ee36a6405df8e671d835723a0832dd2d1d06d6e97fbc25d5513c41dc019655a185cc30ad21bc15af04a59d06aff59ef2cc4d11dc96a3e3e3af7681cba84a2a5a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
