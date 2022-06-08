# Maintainer: Robert Greener <me@r0bert.dev>
_cranname=TraMineR
_cranver=2.2-3
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Trajectory Miner: a Toolbox for Exploring and Rendering Sequences"
arch=(x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL)
depends=(
	r
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
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('3c698e4f79555fbe70358b679c75f9c72c23256568da46c775bbebe8668b72cb')

build() {
  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

