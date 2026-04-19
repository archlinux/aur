# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
_pkgname=TraMineR
_pkgver=2.2-13
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Trajectory Miner: a Toolbox for Exploring and Rendering Sequences"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
	r
	r-vegan
	r-cluster
	r-colorspace
	r-rcolorbrewer
	r-weights
	r-cnorm
	r-boot
)
optdepends=(
	r-xtable
	r-traminerextras
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6fe782c8c67e85465b2aa84fdc610f7bbb90667ec9f35fb5a90623013b241ec8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

