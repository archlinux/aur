# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=varSelRF
_pkgver=0.7-8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Variable Selection using Random Forests"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-randomforest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('103c460d0734bd38ae13496c839d3435')
b2sums=('9d23e3b083b84d71c79ae3faf19022a5b6c6421f6511060e45559172f843303abf86cf7ac2b4b104c48d2df8406f899aa437822766f8ba3e659461838a374b6f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
