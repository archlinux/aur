# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>
_pkgname=TraMineR
_pkgver=2.2-14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
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
sha256sums=('8638b25d65d49ce78a78cc0b7ef3a1a4647d2f18d2d07b747b6da7e13aa71f43')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}

