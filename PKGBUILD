# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOmap
_pkgver=2.5-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Topographic and Geologic Mapping"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-fields
  r-mba
  r-rpmg
  r-sf
)
optdepends=(
  r-geomapdata
  r-maps
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f24aae5a7eb4f18d67db573e5472db09')
b2sums=('e68fd40060f1656675d501e41b9cb6191b476da44a17e90af90eca1697afcc6cd3c844f5e70e0aabfeb32a76d647beedef6a56a7990a5db9fd4acdbfac136cc3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
