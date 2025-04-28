# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DAPARdata
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data accompanying the DAPAR and Prostar packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-msnbase
)
optdepends=(
  r-biocstyle
  r-dapar
  r-knitr
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('22ee1f47c5c696bcf65d7f34ea502585')
b2sums=('c7a2afb34d241404e9d82aaefc2384ea60140f8869fef3bee0006030cbd6f0b86dbefeeaf841aca72a0743bb7ff5bcda6dbea1c7a5f68e59dab9b43b2034dac3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
