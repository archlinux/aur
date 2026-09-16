# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
_pkgname=TraMineRextras
_pkgver=0.6.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="TraMineR Extension"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=("r>=3.5.0" "r-traminer>=2.2.1" r-doparallel r-foreach r-parallelly)
makedepends=()
optdepends=(
	r-gtools
	r-cluster
	r-rcolorbrewer
	r-colorspace
	r-survival
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6bf0215bca2063669c5775b3656e0b3b05b5f820e343968042b588d490958b7b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

