# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
_pkgname=TraMineRextras
_pkgver=0.6.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="TraMineR Extension"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=("r>=3.5.0" "r-traminer>=2.2.1" r-doparallel r-foreach)
makedepends=()
optdepends=(
	r-gtools
	r-cluster
	r-rcolorbrewer
	r-colorspace
	r-survival
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('22e5dced59b22cd24740f90a595253f3d8f1339da07dbe801833399528f090db')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

