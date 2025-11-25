# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
_pkgname=fields
_pkgver=17.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for Spatial Data"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r-maps
  r-rcolorbrewer
  r-spam
  r-viridislite
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-mapproj
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${pkgver}.tar.gz")
md5sums=('fa5819274e8aeaee50164ce2cb2d2505')
b2sums=('c60c9f944ce076585e2ca2a16779e2e219e69ac4a574462bbcdb2f6d6f7fc2f3f429d41dfa63e8dcbc4008b470c8527efc37f9d20545e5964baa213e40e8a2c3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
